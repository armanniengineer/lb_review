class ReviewsController < ApplicationController
  before_action :find_youtuber
  before_action :find_review, only: [ :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [ :edit, :destroy]

  

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.youtuber_id = @youtuber.id
    @review.user_id = current_user.id
    @review = @youtuber.reviews.create(review_params.merge(user_id: current_user.id))

    if @review.save
      redirect_to youtuber_path(@youtuber)
    else
      render 'new'
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to youtuber_path(@youtuber), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to youtuber_path(@youtuber), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
     def find_youtuber
      @youtuber = Youtuber.find(params[:youtuber_id])
    end

    def find_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end

    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
        if @review.nil?
          flash[:alert] = "Not your review!"
          redirect_to :back
        end
    end
end
