class Thing < Neo4j::Rails::Model
  property :name, :type => String
  property :weight, :type => String
  property :size, :type => String

end
