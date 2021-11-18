class Public::CustomersController < ApplicationController
  def show
    @customers=Customer.all
    @customer=current_public_customer

  end
def edit
  @customer=current_public_customer
end

def update
  @customer=current_public_customer
  @customer.update(customer_params)
  redirect_to public_customers_path
end

def index
  @customer=Customer.all
end

def withdrawal
@customer=current_public_customer
end

def withdrawalprcess
  @customer=current_public_customer
   @customer.update(is_active: false)
   reset_session


    redirect_to  root_path

end


private

def customer_params
  params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number)
end
end
