class Admin::ItemsController < ApplicationController
  def new
  @item=Item.new
  end

  def create
  item=Item.new(item_params)
  item.save!
  redirect_to items_path
  end

  def index
    @items=Item.all
  end
  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
    item=Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item.id)
  end
  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image_id, :introduction, :price, :is_active, :created_at, :update, :image)
  end
end