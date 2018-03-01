class YoutubersController < ApplicationController
  before_action :set_youtuber, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @youtubers = Youtuber.all
  end

  def show
  end

  def new
    @youtuber = current_user.youtubers.build
  end

  def edit
  end

  def create
    @youtuber = current_user.youtubers.build(youtuber_params)

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

  private
    def set_youtuber
      @youtuber = Youtuber.find(params[:id])
    end

    def youtuber_params
      params.require(:youtuber).permit(:title, :description, :sexuality, :rating, :image)
    end
end
