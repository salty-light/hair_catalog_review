class Public::ReviewsController < ApplicationController

  def index
    # @reviews = Review.page(params[:page])
    redirect_to hair_catalog_path(params[:hair_catalog_id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id=current_customer.id
    @hair_catalog = HairCatalog.find(params[:hair_catalog_id])
    @review.hair_catalog_id = @hair_catalog.id

    unless review_params[:image].blank?
     result = Vision.get_image_data(review_params[:image]) # 画像の安全度をVisionAPIで図る
    else
     result = true
    end

    if result
      if @review.save
        flash[:success] = "レビューしました"
        redirect_to hair_catalog_path(@hair_catalog)
      else
        @reviews = @hair_catalog.reviews
        render "public/hair_catalogs/show"
      end
    else
      flash[:danger] = "不適切な画像です"
      redirect_to hair_catalog_path(@hair_catalog)
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
   def destroy
    @review = Review.find(params[:id])
    @customer=Customer.find(@review.customer_id)
    if @review.destroy
      flash[:success] = "レビューが削除されました"
    end
    redirect_to customer_path(@customer)
   end

  private

  def review_params
    params.require(:review).permit(:body,  :image ,:score)
  end

end
