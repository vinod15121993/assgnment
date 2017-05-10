class Product
  include Mongoid::Document
  field :name,type: String,default: ""
  field :image_url,type: String,default: ""
  field :images,type: Array,default: []
  field :price,type: Float,default: 0.0
  field :valute,type: String,default: ""
  field :description,type: String,default: ""
  field :returns,type: String,default: ""
  field :special_tag,type: String,default: ""
  
  has_many :variations,dependent: :destroy
  has_many :accessories,dependent: :destroy
 
 accepts_nested_attributes_for :variations,allow_destroy: true
 accepts_nested_attributes_for :accessories,allow_destroy: true

end
