class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :tasks, through: Resource
end