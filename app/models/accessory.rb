class Accessory
  include Mongoid::Document
  belongs_to :product
  field :name,type: String,default: ""
end
