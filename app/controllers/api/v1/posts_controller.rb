class Api::V1::PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def update
    post.find(params[:id])
    post.update
    render json: post, status: :accepted
  end

  def destroy
    Post.find(params[:id]).destroy!

    head :no_content

  end

  private

  def post_params
    params.require(:post).permit(:title, :author)
  end
end
