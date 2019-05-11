class StripeResponseController < ApplicationController
    def success 
        @cart = Cart.new
        session[:cart_id] = @cart.id
        redirect_to '/listings'
    end 

    def cancel

    end 
end
