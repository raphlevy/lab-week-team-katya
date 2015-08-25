require 'factory_girl'

FactoryGirl.define do

  factory :task do
    task_name 'Make dinner'
    date '2015-09-27'
  end

end