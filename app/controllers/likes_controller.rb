class LikesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @post.add_likes
        @post.save
        redirect_to post_path(@post)
    end 
end