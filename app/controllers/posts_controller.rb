class PostsController < ApplicationController

	before_action :find_params, only: [:show, :update, :edit, :destroy]

	def index
		@posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 5)
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render "new"
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render "edit"
		end
	end

	def destroy
		@post.destroy
		
		redirect_to root_path
	end


	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def find_params
		@post = Post.find(params[:id])
	end

end