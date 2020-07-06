# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  user = User.create!(email: 'test@test.com', name: 'thiago', password: '123123123')
  user.profile_picture.attach(io: File.open(Rails.root.join('public', 'woman.jpg')), filename: 'woman.jpg')

  post = Post.create!(user: user, location_name: 'London, England')
  post.post_image.attach(io: File.open(Rails.root.join('public', 'show.jpg')), filename: 'show.jpg')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')

  post = Post.create!(user: user, location_name: 'Rio de Janeiro, Brazil')
  post.post_image.attach(io: File.open(Rails.root.join('public', 'lake.jpg')), filename: 'lake.jpg')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')

  post = Post.create!(user: user, location_name: 'New York, USA')
  post.post_image.attach(io: File.open(Rails.root.join('public', 'trees.jpg')), filename: 'tress.jpg')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')

  post = Post.create!(user: user, location_name: 'Ceará, Brazil')
  post.post_image.attach(io: File.open(Rails.root.join('public', 'lake.jpg')), filename: 'lake.jpg')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')

  post = Post.create!(user: user, location_name: 'Berlin, Germany')
  post.post_image.attach(io: File.open(Rails.root.join('public', 'show.jpg')), filename: 'show.jpg')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')
  post.comments.create(user_id: user.id, comment_text: 'This is a text to show in the comment. I love this photo and love the way you took that picture')
end
