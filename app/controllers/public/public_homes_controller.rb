class Public::PublicHomesController < ApplicationController
  def top
    @items=Item.all
    @items = Item.order(created_at: :desc).limit(1)
  end
end
