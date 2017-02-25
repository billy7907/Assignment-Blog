class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize, only: [:edit, :destroy, :update]

  def new
    @post = Post.new
    @categories = Category.all
  end


  def create
    # redirect_to root_path, alert: "access defined" unless can? :manage, @post
    @post = Post.new(post_params)
    @post.user = current_user
    @category = Category.find(@post.category_id)
    @post.category = @category
    if @post.save
      # render :show
      # redirect_to question_path({id: @question.id})
      # redirect_to question_path({id: @question})
      flash[:notice] = "Post created successfully"
      redirect_to posts_path(@post)

    else
      flash.now[:alert] = "Please fix errors below"
      # this will force rail to render : app/views/questions/new.html.erb
      # instead of the default: app/views/questions/create.html.erb
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
    # if current_user.id == @post.user_id
    @post.destroy
    redirect_to root_path, notice: 'Post deleted!'

  end


  private

  def post_params
    # this feature is called strong parameter (introduced in Rails 4+)
    post_params = params.require(:post).permit([:title, :body, :category_id])
  end

  def authorize
    redirect_to root_path, alert: "access denied" unless can? :manage, @post
  end

end
