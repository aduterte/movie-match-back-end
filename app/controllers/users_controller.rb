class UsersController < ApplicationController

    def show

        user = User.find(params[:id])
        if user 
            render json: user.as_json(include: [:movies, :favorites], except: [:created_at, :updated_at])
        else
            render json: {error_message:  'User not found'}
        end
    end

    def create
        # byebug
        user = User.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
        if user.valid?
            user.save
            payload = {user_id: user.id}
            token = encode(payload)
            
            render :json => {user: user.as_json(include: [:movies], except: [:created_at, :updated_at]), token: token}
        else
            render json: user.errors.full_messages
        end
    end

    def update
        user = User.find(params[:id])
        render json: user
    end

    def login 
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode(payload)
            
            render :json => {user: user.as_json(include: [:movies], except: [:created_at, :updated_at]), token: token}
        else 
            render json: {error_message: "User not found"}
        end
    end

    def token_authenticate
        
        token = request.headers["Authenticate"]
        user = User.find(decode(token)["user_id"])
        render json: user.as_json(include: [:movies], except: [:created_at, :updated_at])
        
    end
end
