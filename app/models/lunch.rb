class Lunch 
  include Mongoid::Document
  include Mongo::Voteable
  #set points for each vote
  voteable self, :up => +1, :down => -1
  field :name, type: String
  field :time, type: String
  field :date, type: String
  has_many :users
  belongs_to :room
end
