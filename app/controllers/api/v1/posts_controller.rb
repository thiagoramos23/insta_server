module Api
  module V1
    class PostsController < ApplicationController
      include ActionView::Helpers::DateHelper
      before_action :set_post, only: [:show, :update, :destroy]

      # GET /posts
      def index
        @posts = Post.includes(:user).joins(:user).all
        @posts = @posts.map do |post|
          {
            id: post.id,
            username: post.user.name,
            user_image_url: Rails.application.routes.url_helpers.rails_blob_url(post.user.profile_picture, host: root_url),
            post_image_url: Rails.application.routes.url_helpers.rails_blob_url(post.post_image, host: root_url),
            location: post.location_name,
            time_posted_since_now: "#{time_ago_in_words(post.created_at)} ago",
            like_count: 10,
            comment_count: 5
          }
        end

        render json: @posts
      end

      # GET /posts/1
      def show
        render json: @post
      end

      # POST /posts
      def create
        @post = Post.new(post_params)

        if @post.save
          render json: @post, status: :created, location: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /posts/1
      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # DELETE /posts/1
      def destroy
        @post.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(:user_id, images: [])
      end

      def root_url
        'http://localhost:3000'
      end
    end
  end
end
