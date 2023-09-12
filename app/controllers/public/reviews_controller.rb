class Public::ReviewsController < ApplicationController

def index
    @reviews = Review.page(params[:page])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(item_params)
    if @review.save
      flash[:success] = "レビューしました"
      redirect_to review_index_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:success] = "更新に成功しました"
      redirect_to review_index_path(@review)
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:hair_long_id, :name, :explamatory_text,  :image)
  end

end
