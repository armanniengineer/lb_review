class YoutubersController < ApplicationController
  before_action :set_youtuber, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :owned_youtuber, only: [:edit, :update, :destroy]

  def search
    if params[:search].present?
      @youtubers = Youtuber.search(params[:search])
    else
      @youtubers = Youtuber.all
    end
  end
  
  def index
    @youtubers = Youtuber.all.order("created_at DESC")
  end

  def show
    @reviews = @youtuber.reviews.order("created_at DESC")
     unless @reviews.present?
      @average_review = 0
    else
      @average_review = @reviews.average(:rating).present? ? @reviews.average(:rating).round(2) : 0
    end
  end

  def new
    @youtuber = current_user.youtubers.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end
 
  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @youtuber = current_user.youtubers.build(youtuber_params)
    @youtuber.category_id = params[:category_id]

    respond_to do |format|
      if @youtuber.save
        format.html { redirect_to @youtuber, notice: 'Youtuber was successfully created.' }
        format.json { render :show, status: :created, location: @youtuber }
      else
        format.html { render :new }
        format.json { render json: @youtuber.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @youtuber.category_id = params[:category_id]
    respond_to do |format|
      if @youtuber.update(youtuber_params)
        format.html { redirect_to @youtuber, notice: 'Youtuber was successfully updated.' }
        format.json { render :show, status: :ok, location: @youtuber }
      else
        format.html { render :edit }
        format.json { render json: @youtuber.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @youtuber.destroy
    respond_to do |format|
      format.html { redirect_to youtubers_url, notice: 'Youtuber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def upvote
    @youtuber.upvote_from current_user
    redirect_back(fallback_location: root_path) 
  end

  def downvote
    @youtuber.downvote_from current_user
    redirect_back(fallback_location: root_path)
  end

  private
  
    def set_youtuber
      @youtuber = Youtuber.find(params[:id])
    end

    def youtuber_params
      params.require(:youtuber).permit(:title, :description, :category_id, :rating, :image)
    end

    def owned_youtuber
      unless @youtuber.user.id == current_user.id
        flash[:alert] = "You didn't create this youtuber!"
        redirect_to root_path
      end
    end
end
