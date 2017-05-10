class Variation
  include Mongoid::Document
 
   belongs_to :product
   field :name,type: String,default: ""
  
   has_many :options, dependent: :destroy
   accepts_nested_attributes_for :options,allow_destroy: true
end
