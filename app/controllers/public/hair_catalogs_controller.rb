class Public::HairCatalogsController < ApplicationController
before_action :authenticate_customer!
 def index
     if params[:latest]
      @hair_catalogs = HairCatalog.latest
     elsif params[:old]
      @hair_catalogs = HairCatalog.old
     elsif params[:star_count]
      @hair_catalogs = HairCatalog.star_count
     else
      @hair_catalogs = HairCatalog.all.order(created_at: :desc).page(params[:page])
     end
 end

  def show
   @hair_catalog = HairCatalog.find(params[:id])
   @new_hair_catalog = HairCatalog.new
   @review = Review.new
   if params[:start_date] && params[:end_date]
    @reviews = @hair_catalog.reviews.where(created_at:  params[:start_date].. params[:end_date] )
   else 
     @reviews = @hair_catalog.reviews
   end
  end
private

  def customer_params
    params.require(:hair_catalog).permit(:hair_long_id, :name, :explamatory_text,  :image)
  end
end