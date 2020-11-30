class ApplicationController < ActionController::API
    def encode_token(payload)
        # should store secret in env variable
        JWT.encode(payload, ENV['jwt_encode_string'])
      end
     
      def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
      end
     
      def decoded_token
        if auth_header
          token = auth_header
          # header: { 'Authorization': '<token>' }
          begin
            JWT.decode(token, ENV['jwt_encode_string'], true, algorithm: 'HS256')
          rescue JWT::DecodeError
            nil
          end
        end
      end
     
      def logged_in_customer
        if decoded_token
          customer_id = decoded_token[0]['customer_id']
          @customer = Customer.find_by(id: customer_id)
        end
      end
     
      def logged_in?
        !!logged_in_customer
      end
     
      def authorized
        render json: { error_message: 'Please log in' }, status: :unauthorized unless logged_in?
      end
end
