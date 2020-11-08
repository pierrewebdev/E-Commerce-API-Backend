class ReviewsController < ApplicationController
    before_action :authorized, only: [:create]
    def create
      #need a customer and a product
      permitted_params = review_params

      review_info = {
        customer:@customer,
        product_id: permitted_params[:productId],
        headline: permitted_params[:headline],
        content: permitted_params[:content],
        rating: permitted_params[:rating]
      }

      new_product_review = Review.create(review_info)
      render json: new_product_review
    end


    private
    def review_params
        params.permit(:content,:headline,:rating,:productId)
    end
end
