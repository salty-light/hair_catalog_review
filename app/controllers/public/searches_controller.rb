class Public::SearchesController < ApplicationController
 before_action :authenticate_customer!

  def search
    #@range = params[:range]
    @word = params[:word]

    #if @range == "Customer"
      #@customers = Customer.looks(params[:search], params[:word])
    #else
      @hair_catalogs = HairCatalog.looks(params[:search], params[:word])
      render 'public/hair_catalogs/index'
    #end
  end
end
