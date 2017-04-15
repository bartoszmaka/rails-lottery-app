class ItemsController < ApplicationController
  before_action :ensure_current_user_admin?, except: [:show, :index, :bid]
  expose(:q) { Item.ransack(params[:q]) }
  expose_decorated(:items) { q.result.page(params[:page]) }
  expose_decorated(:item, build_params: :item_params)

  def create
    if item.save
      flash[:success] = 'Item successfully added'
      redirect_to item
    else
      flash[:danger] = 'Failed to add item'
      render 'new'
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
      render 'edit'
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
    outcome = Bid.run(user: current_user, item: item)
    if outcome.valid?
      flash[:success] = outcome.result
    else
      flash[:danger] = outcome.errors.messages.values.flatten.join(' and ')
    end
    redirect_to item
  end

  def draw
    outcome = Draw.run(item: item)
    if outcome.valid?
      flash[:success] = outcome.result
      DrawMailer.draw_won(item).deliver_now
    else
      flash[:danger] = outcome.errors.messages.values.flatten.join(' and ')
    end
    redirect_to item
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
