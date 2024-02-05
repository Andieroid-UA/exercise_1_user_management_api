class ApplicationController < ActionController::API
    def create
        @user = User.new(name: params[:name], email: params[:email])
        if @user.save
          render json: @user
        else
          render json: { error: "Unable to create user." }
        end
      end
end
