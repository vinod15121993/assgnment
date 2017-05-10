class ProductsController < ApplicationController

  def create
     @product = Product.new(product_params)
     if @product.save!
       render :json =>
        {
        response_message: "Success"
         }
     else
       render :json =>
        {
        response_message: "Failure"
         }
     end 
  end  
  
  
  def show
    @product = Product.find_by(id: params[:id])
    render_message 500, "Product not found." and return if @product.blank?
     render :json =>
      {
        product_detail: @product.as_json(only: [:_id,:name,:image_url,:images,:price,:valute,:description,:returns,:special_tags]).merge!(variations: @product.variations.map{ |variation|  variation.as_json(only: [:_id,:name]) },accessories: @product.accessories.map {|a| a.as_json(only: [:_id,:name] ) } ),
        response_message: "Success"
      }
  end 

private
  
  def product_params
    params.require(:product).permit(:name,:image_url,{ images: [] },:price,:valute,:description,:returns,:special_tags,variations_attribuites: [:name, options_attributes: [:name,:image_url]],accessories_attributes: [:name])
  end  


end
