class Car < Neo4j::Rails::Model
  property :name, :type => String
  property :make, :type => String
  property :model, :type => Fixnum

end
