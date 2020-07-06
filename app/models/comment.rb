class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def to_h
    {
      id:             id,
      post_id:        post_id,
      user_id:        user_id,
      username:       user.name,
      user_image_url: Rails.application.routes.url_helpers.rails_blob_url(user.profile_picture, host: 'http://localhost:3000'),
      comment_text:   comment_text
    }
  end
end
