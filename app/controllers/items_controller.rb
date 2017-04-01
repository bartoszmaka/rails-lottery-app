class ItemsController < ApplicationController
  before_action :current_user_admin?, except: [:show, :index]
  expose(:items) { Item.all.page(params[:page]) }
  expose(:item, build_params: :item_params)

  def create
    if item.save
      params[:success] = 'Item successfully added'
      redirect_to item
    else
      params[:danger] = 'Failed to add item'
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    if item.save
      params[:success] = 'Item successfully added'
      redirect_to item
    else
      params[:danger] = 'Failed to add item'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
