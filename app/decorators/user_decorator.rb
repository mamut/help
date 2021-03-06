class UserDecorator < Draper::Decorator

  decorates :user

  delegate :to_s, :email, :id, :supports_count

  def topic_class(topic)
    object.helps_with?(topic.object) ? "btn-success" : "btn-danger"
  end

  def help_summary(topic)
    object.helps_with?(topic.object) ? "you can help with that!" : "you are not helping yet."
  end

  def gravatar(size = 80)
    h.gravatar_image_tag(object.email, size)
  end

  def info
    h.content_tag :span, h.raw(h.link_to(gravatar + to_s, object))
  end

end
