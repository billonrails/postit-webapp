class CommentsController < ApplicationController
	before_action :require_user
def create
		@post = Post.find(params[:post_id])
		#creates the comment and the @post.comment.build sets the comment to the post
		@comment = @post.comments.build(comment_params) 
		@comment.creator = current_user


		#@comment.post = @post

		if @comment.save
			flash[:notice] = "Comment has been added."
			redirect_to post_path(@post)
		else
			render 'posts/show'
		end

		#def show
			#@comment = Comment.find(params[:id])
		#end	

		def vote
			comment = Comment.find(params[:id])
			Vote.create(voteable: comment, creator: current_user, vote: params[:vote])

			if vote.valid?
      	flash[:notice] = "Your vote was counted."
    	else
      	flash[:error] = "You can only vote on a comment once."
    	end
    	
				redirect_to :back				
		end		
end

	private
	def comment_params
		params.require(:comment).permit(:body) 
	end


end
