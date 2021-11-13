class Admin::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def verification
       @order=Order.new(order_params)
       @cart_items=CartItem.all
       @sum=0

    if params[:order][:address_select] == 'my_address'
       @order.address =  current_public_customer.address
       @order.postal_code=current_public_customer.postal_code
       @order.delivery_name=current_public_customer.last_name



    elsif params[:order][:address_select] =='registered_address'
       order_params[:address]
      @address =Address.find(params[:order][:address_id])
      @order.address = @address.address
      @order.postal_code=@address.postal_code
      @order.delivery_name=@address.name

    end


  end

  def create
  order=Order.new(order_params)
  order.customer_id=current_public_customer.id
  order.postage= 800

  order.save


 current_public_customer.cart_items.each do |cart_item|
     order_detail=order.order_details.new
    #order_detail = order.order_details.build
    #order_detail.order_id=order.id
    order_detail.item_id=cart_item.item_id
    order_detail.quantity=cart_item.amount
    order_detail.unit_price=(cart_item.item.price * 1.1).floor
    order_detail.save
  end
    current_public_customer.cart_items.destroy_all

  redirect_to public_orders_complecation_path
  end

def index
  @orders=Order.all

end
  def complecation

  end

  def edit
    @order=Order.find(params[:id])
    @order_details=@order.order_details

  end


  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :delivery_name, :customer_id, :billing_amount, :postage,)
  end


end

