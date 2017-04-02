class ItemsController < ApplicationController
  before_action :ensure_current_user_admin?, except: [:show, :index, :bid]
  expose(:items) { Item.all.page(params[:page]) }
  expose(:item, build_params: :item_params)

  def create
    if item.save
      flash[:success] = 'Item successfully added'
      redirect_to item
    else
      flash[:danger] = 'Failed to add item'
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    if item.users.any?
      flash[:danger] = "can't edit bidded item!"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    if item.users.any?
      flash[:danger] = "can't update bidded item!"
      redirect_back(fallback_location: root_path)
    elsif item.save
      flash[:success] = 'Item successfully updated'
      redirect_to item
    else
      flash[:danger] = 'Failed to update item'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if item.users.empty?
      item.destroy
      redirect_to items_path
      flash[:warning] = 'item successfully destroyed'
    else
      flash[:danger] = "can't destroy bidded item!"
      redirect_back(fallback_location: root_path)
    end
  end

  def bid
    # if item.biddable?
    if current_user.items.include?(item)
      flash[:danger] = "You can't bid the same item twice!"
    else
      flash[:success] = 'Item successfully bidded'
      current_user.items << item
    end
    redirect_to item
  end

  def draw
    if item.users.count > 1
      item.update(winner: item.users.sample)
    else
      flash[:danger] = 'not enough users to run draw'
    end
    redirect_to item
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
