class User #< ActiveRecord::Base
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  validates :name, presence: true
end
