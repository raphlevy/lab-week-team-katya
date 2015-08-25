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
        @task = Task.create(task_name: params[:task_name], date: params[:date])
        params[:tag].split(' ').each do |tag_separated|
          @tag = Tag.create(name: tag_separated)
          @task.tags << @tag
        end
        @task.save
        redirect to '/tasks'
      end

      get '/tags/:name' do
        @tag = Tag.first(name: params[:name])
        @tasks = @tag ? @tag.tasks : []
        haml :'tasks/index'
      end


    end
  end
end
