module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_post

      # GET /comments
      def index
        @comments = @post.comments

        render json: @comments
      end

      # POST /comments
      def create
        @comment = Comment.new(comment_params)

        if @comment.save
          render json: @comment, status: :created, location: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      private

      def set_post
        @post = ::Post.find(params[:post_id])
      end

      # Only allow a trusted parameter "white list" through.
      def comment_params
        params.require(:comment).permit(:post_id, :user_id, :comment_text)
      end
    end
  end
end
