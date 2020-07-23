class BloggersController < ApplicationController
    def show
        @blogger = Blogger.find(params[:id])
        @most_liked_post = @blogger.most_likes
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.create(blogger_params)
        if @blogger.valid?
            redirect_to blogger_path(@blogger)
        else
            flash[:my_errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end


    private

    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio)
    end
end
