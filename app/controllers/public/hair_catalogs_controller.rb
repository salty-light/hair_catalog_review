class Public::HairCatalogsController < ApplicationController
 def index
     @hair_catalogs = HairCatalog.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @hair_catalog = HairCatalog.find(params[:id])
   @hair_catalog = HairCatalog.new
  end

end
