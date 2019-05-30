class Api::V1::TokensController < ApplicationController
    def index
        tokens = Token.all
        render json: {status: 'Success', data: tokens}, status: :ok
    end

    def show
        token = Token.find(params[:id])
        render json: {status: 'Success', data: token}, status: :ok
    end
    
end