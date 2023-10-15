class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :guest_check, only: [:edit, :update, :confirm, :withdraw]

  def show
    @customer = current_customer
    @reviews = Review.where(customer_id: @customer.id).order(created_at: :desc)
    #byebug
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to current_customer
  end


  def confirm
    @customer = current_customer
  end

  def withdraw
    customer = current_customer
    customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def guest_check
    redirect_to root_path and return if current_customer.email == "guest@example.com"
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nick_name, :email, :image)
  end
end
