class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :find_user, only: [:new, :create, :edit, :update, :destroy]
  
    # GET /posts
    def index
      @posts = current_user.posts
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
      if @post.user != current_user
        redirect_to user_posts_path, alert: "You do not have permission to edit this post."
      end
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
      if @post.user != current_user
        redirect_to user_posts_path, alert: "You do not have permission to edit this post."
      else
        if @post.update(post_params)
          redirect_to user_post_path(current_user, @post), notice: 'Post was successfully updated.'
        else
          render :edit
        end
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
      params.require(:post).permit(:title, :description, :price, :year, :km, :region, :post_status, :user_id)
    end
  end
  