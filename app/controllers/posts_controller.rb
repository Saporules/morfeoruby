class PostsController < ApplicationController

  respond_to :json

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts, :include => :tags  }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    if params['tag_field'] != nil
      tags_array = params['tag_field'].split(",")
      tags_array.each do |tag|
        @post.tags << Tag.find_or_create_by_etiqueta_and_post_id(tag.strip, @post.id)
      end
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def get_by_user
    @post = Post.find_all_by_ip(params[:user])
    respond_to do |format|
      format.json { render :json => @post }
    end
  end
  def search
    @tag = Tag.where(:etiqueta => params[:tag])
    respond_to do |format|
      format.json { render :json => @tag, :include => :post  }
    end
  end
  def related
    @tags = Post.find_all_by_ip(param[:user])
    respond_to do |format|
      format.json { render :json => @post, :include => :post  }
    end
  end
end
