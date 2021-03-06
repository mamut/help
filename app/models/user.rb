class User < ActiveRecord::Base

  has_many :skills
  has_many :topics, through: :skills
  has_many :supports
  has_many :received_supports, as: :receiver

  def name
    "#{first_name} #{last_name}"
  end

  def to_s
    name
  end

  def helps_with?(topic)
    @topic_ids ||= skills.pluck(:topic_id)
    @topic_ids.include?(topic.id)
  end

end
