class PostsController < ApplicationController
    before_action :post_find, only: [:show, :edit, :update]


    def show
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            flash[:list_errors] = @post.errors.full_messages
            redirect_to new_post_path
        end    
    end

    def edit 
    end

    def update
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            flash[:list_errors] = @post.errors.full_messages
            redirect_to edit_post_path
        end
    end

    def likes
        @post = Post.find(params[:post_id])
        @post.increment!(:likes) 
        redirect_to post_path(@post)
    end


    private

    def post_find
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

end
