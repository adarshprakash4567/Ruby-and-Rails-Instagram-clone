class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  #below,If the user is not authenticated then it works expect the index ,show functions
  before_action :authenticate_user!,except: [:index, :show]
  include Pagy::Backend

  def index
    # Fetch all posts, ordered by created_at in ascending order
    
    @posts = Post.order(:created_at => :asc)
  
    # Debugging output before pagination
    puts "Total Posts Count: #{@posts.count}"
  
    # Initialize Pagy for pagination, limiting to 1 post per page

    @pagy, @posts = pagy(@posts, limit: 2)
  
    # Debugging output after pagination
    puts "Posts After Pagy: #{@posts.count}"
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  def show
    #Post 
    @comment = @post.comments.build
  end
 
  
  # GET /posts/new
  def new
    @post = Post.new
  end
  def myposts
   
    @posts = Post.all
  end
  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    puts "Post Params: #{post_params.inspect}"
    puts "Post ID: #{@post.id}"  # This should be nil for a new record
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end


    # Only allow a list of trusted parameters through.below the post model permits the title,description and keyword
    def post_params
      params.require(:post).permit(:title, :description, :keyword, :user_id, images: [])
    end
end
                                                                                  