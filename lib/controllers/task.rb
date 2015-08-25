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
        @tag = Tag.create(name: params[:tag])
        @tag.each do |tag_separated|
        @task.tags << tag_separated
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
