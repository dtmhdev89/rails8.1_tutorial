class SubscribersController < ApplicationController
    allow_unauthenticated_access

    def create
        product.subscribers.where(subscriber_params).first_or_create

        redirect_to product, notice: "You are now subscribed"
    end

    private

        def product
            @product ||= Product.find(params[:product_id])
        end

        def subscriber_params
            params.expect(subscriber: [:email])
        end
end
