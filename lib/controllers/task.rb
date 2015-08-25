require_relative './base.rb'

module VirtualAssistant
  module Routes
    class TaskController < Base

      get '/tasks' do
        @tasks = Task.all
        haml :'tasks/index'
      end



      # get '/users/new' do
      #   @user = User.new
      #   haml :'users/new'
      # end

      # post '/users' do
      #   # byebug
      #   @user = User.create(email: params[:email],
      #                       password: params[:password],
      #                       password_confirmation: params[:password_confirmation],
      #                       name: params[:name])
      #   if @user.save
      #     session[:user_id] = @user.id
      #     redirect to('/')
      #   else
      #     flash.now[:errors] = @user.errors.full_messages
      #     haml :'users/new'
      #   end
      # end

    end
  end
end
