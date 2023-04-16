class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :find_user, only: [:new, :create, :edit, :update, :destroy]
  
    # GET /posts
    def index
      @posts = Post.all
    end
  
    # GET /posts/1
    def show
    end
  
    # GET /posts/new
    def new
      @post = Post.new
    end
  
    # GET /posts/1/edit
    def edit
    end
  
    # POST /posts
    def create
      @post = Post.new(post_params)
      @post.user = current_user # assuming you have a current_user method in your application
  
      if @post.save
        redirect_to user_posts_path, notice: 'Post was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to user_post_path(current_user, @post), notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /posts/1
    def destroy
         @post.destroy
        redirect_to user_posts_path, notice: 'Post was successfully destroyed.'
            
    end
  
    private

    def find_user
        @user = current_user
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :price, :year, :km, :post_status, :user_id)
    end
  end
  