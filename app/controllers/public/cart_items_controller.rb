class Public::CartItemsController < ApplicationController
  def create

     @my_cart_item = current_public_customer.cart_items.find_by(item_id: params[:cart_item] [:item_id])
    if  @my_cart_item.present?

      @my_cart_item.update( amount: @my_cart_item.amount + params[:cart_item][:amount].to_i)


    else

       @cart_item=CartItem.new(cart_item_params)
       @cart_item.customer_id=current_public_customer.id
       @cart_item.save


    end
    redirect_to public_cart_items_path


  end

  def index
     @cart_items=CartItem.all
     @sum=0


  end

  def update
     cart_item=CartItem.find(params[:id])
     cart_item.update(cart_item_params)
     redirect_to public_cart_items_path
  end


  def destroy

  cart_item=CartItem.find(params[:id])
  cart_item.destroy
  redirect_to  public_cart_items_path
  end

  def all_destroy
   current_public_customer.cart_items.destroy_all
   redirect_to  public_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount )
  end

end
