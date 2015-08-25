class Task

  include DataMapper::Resource

  validates_presence_of :task_name

  property :id, Serial
  property :task_name, String
  property :date, Date

  has n, :tags, through: Resource
end
