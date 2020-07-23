class DestinationsController < ApplicationController
    def show
        set_method
    end


    private

    def set_method
        @destination = Destination.find(params[:id])
    end

end
