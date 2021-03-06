class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user, only: [:toggle_follow, :toggle_like, :create]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @follow_status = current_user.follows?(@post.user) ? 'Unfollow' : 'Follow'
    @like_status = current_user.likes?(@post) ? 'Unlike' : 'Like'
  end


  def toggle_follow
    @user.toggle_follow!(User.find(params[:user_id]))
    redirect_to :back
  end

  def toggle_like
    current_user.toggle_like!(Post.find(params[:id]))
    # current_user.toggle_like!(@post)
    redirect_to :back
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def following_posts


  end


  def following_list

      @following_user_list = current_user.followees(User)

  end


  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    # @post.user_id = current_user.id
    @post.user_id = @user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id]) # pulling id from URL, only variable available
    end


      def set_current_user
        @user = current_user
      end



    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :user_id)
    end


end
