class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.Create(item_params)
    if @item.save?
      params[:success] = 'Item successfully added'
    else
      params[:danger] = 'Failed to add item'
    end
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
