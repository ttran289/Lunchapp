class Room
  include Mongoid::Document
  field :name
  has_many :lunches
  belongs_to :users
end
