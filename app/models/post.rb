class Post < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :user
  has_one_attached :post_image

  has_many :comments

  def to_json
    {
      id: id,
      username: user.name,
      user_image_url: Rails.application.routes.url_helpers.rails_blob_url(user.profile_picture, host: root_url),
      post_image_url: Rails.application.routes.url_helpers.rails_blob_url(post_image, host: root_url),
      location: location_name,
      time_posted_since_now: "#{time_ago_in_words(created_at)} ago",
      like_count: 10,
      comment_count: comments.size
    }
  end

  private

  def root_url
    'http://localhost:3000'
  end
end
