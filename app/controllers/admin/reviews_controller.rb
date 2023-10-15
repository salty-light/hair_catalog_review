class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @reviews = Review.page(params[:page])
  end
  def destroy
    @review = Review.find(params[:id])
    @customer=Customer.find(@review.customer_id)
    if @review.destroy
      flash[:success] = "レビューが削除されました"
    end
    redirect_to admin_reviews_path
  end
end
