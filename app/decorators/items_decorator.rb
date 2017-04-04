class ItemsDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_pages, :limit_value, :entry_name, :total_count, :offset_value, :last_page?
  def available_items
    h.content_tag :h2 do
      "currently #{h.pluralize(available_items_count, 'item')} available"
    end
  end

  private

  def available_items_count
    Item.undrawn.count - (h.current_user.items.count - h.current_user.won_items.count)
  end
end
