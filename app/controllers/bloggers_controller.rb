class BloggersController < ApplicationController
    
    def show
        set_method
    end


    private

    def set_method
        @blogger = Blogger.find(params[:id])
    end

end
