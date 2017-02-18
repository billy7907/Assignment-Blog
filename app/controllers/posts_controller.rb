class PostsController < ApplicationController

  def new
    @post = Post.new
    @categories = Category.all
  end


  def create
    @post = Post.new(post_params)
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
    @post = Post.find params[:id]
    @comment = Comment.new

  end

  def index
    @post = Post.order(created_at: :desc)
  end


  private

  def post_params
    # this feature is called strong parameter (introduced in Rails 4+)
    post_params = params.require(:post).permit([:title, :body, :category_id])
  end

end
