class Admin::HairLongsController < ApplicationController
protect_from_forgery 
def index
    @hair_long = HairLong.new
  @hair_longs = HairLong.all
end
  
  def create
    @hair_long = HairLong.new(hair_long_params)
    @hair_long.save
    redirect_to admin_hair_longs_path
  end

  def edit
    @hair_long = HairLong.find(params[:id])
  end
  
  def update
     @hair_long = HairLong.find(params[:id])
    @hair_long.update(hair_long_params)
    redirect_to admin_hair_longs_path
  end
  
  def destroy
     @hair_long = HairLong.find(params[:id])
      if @hair_long.destroy
      flash[:success] = "ヘアロングが削除されました"
      end
    redirect_to admin_hair_longs_path
  end 
   
  private
  
  def hair_long_params
    params.require(:hair_long).permit(:name)
  end
end
