class CommentsController < ApplicationController
#lets now create comments

	def create
		@post = Post.find(params[:post_id])#we write the fullname becos we are not in the postcontroller
		@comment = @post.comments.create(params[:comment].permit(:name, :body))

		redirect_to post_path(@post) #redirect to the instance of the post
		#to show the comment in our show page we are going to have to create a few partials
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id]) #to get the comment id within the commentcontroller, no need of explicitnesss
		@comment.destroy

		redirect_to post_path(@post)
	end
end
