require_relative './base.rb'

module VirtualAssistant
  module Routes
    class TaskController < Base

      get '/tasks' do
        @tasks = Task.all
        haml :'tasks/index'
      end

      get '/tasks/new' do 
        haml :'tasks/new'
      end 

      post '/tasks' do 
        @task = Task.create(task_name: params[:task_name],
                          date: params[:date])
        redirect to '/tasks'
      end 
    end
  end
end
