class ItemDecorator < Draper::Decorator
  delegate_all
  decorates_association :users

  def avatar
    h.image_tag('default', size: '64x64')
  end

  def link_to_destroy
    h.link_to 'Destroy', h.item_path(object), class: 'btn btn-danger', method: :delete
  end

  def link_to_bid
    h.link_to 'Bid!', h.bid_item_path, class: 'btn btn-success', method: :post unless object.won?
  end

  def link_to_edit
    h.link_to 'Edit', h.edit_item_path(object), class: 'btn btn-primary'
  end

  def link_to_draw
    return unless h.current_user.admin? && object.drawable?
    h.link_to 'Run Draw!', h.draw_item_path, class: 'btn btn-warning', method: :post
  end

  # def link_to_destroy_and_edit
  #   h.concat(
  #     h.link_to 'Destroy', h.item_path(object), class: 'btn btn-danger', method: :delete
  #   )
  #   h.link_to 'Edit', h.edit_item_path(item), class: 'btn btn-primary'
  # end
end
