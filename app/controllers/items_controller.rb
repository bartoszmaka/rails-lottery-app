class ItemsController < ApplicationController
  def index
    @items = Item.all
    # items where bidders = 0
    # 6 items per page
  end

  def show
    @item = Item.find(params[:id])
    # bidders
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      params[:success] = 'Item successfully added'
      redirect_to @item
    else
      params[:danger] = 'Failed to add item'
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.update(params[:id], item_params)
    if @item.save
      params[:success] = 'Item successfully added'
      redirect_to @item
    else
      params[:danger] = 'Failed to add item'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Item.destroy(params[:id])
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
