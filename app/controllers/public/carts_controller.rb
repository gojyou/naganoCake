class Public::CartsController < ApplicationController


  def show
    p session[:cart]
    return if session[:cart].blank?
    @cart = []
    session[:cart].each do |cart|
      item = Item.find_by(id: cart["item_id"])
      sub_total = item.price * cart["quantity"].to_i
      next unless product

      @cart.push({ item_id: item.id,
                   name: item.item_name,
                   category_name: iyem.category.category_name,
                   price: item.price,
                   quantity: cart["quantity"].to_i,
                   sub_total: sub_total })

    end
    @cart_total_price = cart_total_price(@cart)
  end

  def add_cart
    # session内の商品の有無で条件分岐
    if session[:cart].blank?
      # 商品が入っていない場合
      session[:cart] = [{ item_id: params["item_id"], quantity: params["quantity"].to_i }]
      return redirect_to public_carts_show_path
    end
    # 商品が既に入っている場合、追加する商品が重複するかで条件分岐
    match = session[:cart].select {|cart| cart["item_id"] == params["item_id"] }
    # 重複が発生する場合
    if match.present?
      match[0]["quantity"] += params["quantity"].to_i
    # 重複が発生しない場合
    else
      session[:cart].push({ item_id: params["item_id"], quantity: params["quantity"].to_i })
    end
    redirect_to public_carts_show_path
  end

  # カート内商品の数量変更
  def change_quantity
    array_index = session[:cart].each_index.select {|i| session[:cart][i]["item_id"] == params["item_id"] }
    session[:cart][array_index[0]]["quantity"] = params["quantity"]
    redirect_to public_carts_show_path
  end

  # カート内商品の削除
  def destroy_carts_item
    array_index = session[:cart].each_index.select {|i| session[:cart][i]["item_id"] == params["item_id"] }
    session[:cart].delete_at(array_index[0])
    redirect_to public_carts_show_path
  end

  # カート内商品の合計金額の計算
  def cart_total_price(cart)
    cart.sum { _1[:sub_total] }
  end
  def change_quantity
    array_index = session[:cart].each_index.select {|i| session[:cart][i]["item_id"] == params["item_id"] }
    session[:cart][array_index[0]]["quantity"] = params["quantity"]
    redirect_to public_carts_show_path
  end

  # カート内商品の削除

end

