class Micropost
  include Mongoid::Document
  field :content, type: String
  field :user_id, type: Integer
end
