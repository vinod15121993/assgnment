class Option
  include Mongoid::Document
  belongs_to :variation
  field :name,type: String,default: ""
  field :image_url,type: String,default: ""
end
