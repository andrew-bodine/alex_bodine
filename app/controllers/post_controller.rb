class PostController < ApplicationController
  def post_params
    params.require(:post).permit(
      :header,
      :content
    )
  end

  # before_action :set_post, only: [:, :update, :des]

  def create
    @post = Post.new post_params

    begin
      if @post.valid?
        @post.save
        render json: @post, status: :created
      else
        render json: @post.errors, status: :bad_request
      end
    rescue
      render json: @post.errors, status: :bad_request
    end
  end

  def read
    
  end
end
  