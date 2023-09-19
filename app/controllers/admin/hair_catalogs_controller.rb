class Admin::HairCatalogsController < ApplicationController
 def index
    @hair_catalogs = HairCatalog.all
 end

  def new
    @hair_catalog = HairCatalog.new
  end

  def create
    @hair_catalog = HairCatalog.new(hair_catalog_params)
    if @hair_catalog.save
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
 def destroy
   @hair_catalog = HairCatalog.find(params[:id]) 
    if @hair_catalog.destroy
      flash[:success] = "レビューが削除されました"
    end
    redirect_to admin_hair_catalogs_path
 end 

  private

  def hair_catalog_params
    params.require(:hair_catalog).permit(:hair_long_id, :name, :explamatory_text,  :image)
  end

end
