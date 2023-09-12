class Admin::HairCatalogsController < ApplicationController
 def index
    @hair_catalogs = HairCatalog.all
  end

  def new
    @hair_catalog = HairCatalog.new
  end

  def create
    @hair_catalog = HairCatalog.new(item_params)
    if @haircatalog.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_hair_catalogs_path(@hair_catalog)
    else
      render :new
    end
  end

  def show
    @hair_catalog = HairCatalog.find(params[:id])
  end

  def edit
   @hair_catalog = HairCatalog.find(params[:id])
  end

  def update
   @hair_catalog = HairCatalog.find(params[:id])
    if @hair_catalog.update(hair_catalog_params)
      flash[:success] = "更新に成功しました"
     redirect_to admin_hair_catalogs_path(@hair_catalog)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:hair_catalog).permit(:hair_longs_id, :name, :explamatory_text,  :image)
  end

end
