class Public::AddressesController < ApplicationController

  def new
    @address=Address.new
     @addresses=current_public_customer.addresses

  end

  def create
    address=Address.new(address_params)
   address.customer_id= current_public_customer.id
    address.save
    redirect_to  new_public_addresses_path
  end

  def index
    @addresses=Address.all
  end

  def destroy
    @address=current_public_address
    @address.destroy
    redirect_to new_public_addresses
  end

  def edit
    @address=current_public_address
  end

  def update
    address=current_public_address
    address.update
    redirect_to new_public_addresses
  end

  private

  def address_params
    params.require(:address).permit(:name, :address, :postal_code,)
  end
end
