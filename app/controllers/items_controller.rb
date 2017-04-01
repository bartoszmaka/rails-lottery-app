class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.update(params[:id], item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
