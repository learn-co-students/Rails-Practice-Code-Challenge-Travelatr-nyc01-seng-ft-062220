class PostsController < ApplicationController

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.new(params_method)
        if @post.save
            redirect_to post_path(@post)
        else
            flash[:user_error] = @post.errors.full_messages
            redirect_to new_post_path
        end    
    end

    def edit
        set_method
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def update
        set_method
        if @post.update(params_method)
            redirect_to post_path(@post)
        else
            flash[:user_error] = @post.errors.full_messages
            redirect_to edit_post_path(@post)
        end
    end

    def show
        set_method
    end

    private

    def set_method
        @post = Post.find(params[:id])
    end

    def params_method
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

end