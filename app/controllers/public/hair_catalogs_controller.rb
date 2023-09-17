class Public::HairCatalogsController < ApplicationController
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
  end
private

  def customer_params
    params.require(:hair_catalog).permit(:hair_long_id, :name, :explamatory_text,  :image)
  end
end