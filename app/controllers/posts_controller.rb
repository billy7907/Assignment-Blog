class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize, only: [:edit, :destroy, :update]

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @category = Category.find(@post.category_id)
    @post.category = @category
    if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to posts_path(@post)
    else
      flash.now[:alert] = "Please fix errors below"
      render :new
    end
  end

  def show
    @posts = Post.order(created_at: :desc)
    @post = Post.find params[:id]
    @comment = Comment.new
  end

  def index
    @post = Post.order(created_at: :desc)
  end

  def edit
    @post = Post.find params[:id]
    redirect_to root_path, alert: "access denied" unless can? :edit, @post
    @categories = Category.all
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to root_path, notice: 'Post deleted!'
  end


  private

  def post_params
    post_params = params.require(:post).permit([:title, :body, :category_id])
  end

  def authorize
    redirect_to root_path, alert: "access denied" unless can? :manage, @post
  end

end
