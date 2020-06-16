class NotificationTemplate < ApplicationRecord
  def render(data)
    template = Liquid::Template.parse(body)
    template.render(data)
  end
end
