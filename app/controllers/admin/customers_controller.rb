class Admin::CustomersController < ApplicationController
  def show
    @customers=Customer.all
    @customer=Customer.find(params[:id])

  end
def edit
  @customer=Customer.find(params[:id])
end

def update
  @customer=Customer.find(params[:id])
  @customer.update(customer_params)
  redirect_to  admin_customer_path(@customer.id)
end

def index
  @customers=Customer.all
end


private

def customer_params
  params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active, :updated_at, :created_at)
end
end
