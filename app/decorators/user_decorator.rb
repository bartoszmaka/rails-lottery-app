class UserDecorator < Draper::Decorator
  delegate_all

  def avatar
    h.image_tag('default', size: '64x64')
  end

  def name_and_domain
    name, domain = email.split('@')
    h.content_tag(:table, class: 'table table-sm') do
      h.concat(h.content_tag(:td, name))
      h.concat(h.content_tag(:td, domain))
    end
  end
end
