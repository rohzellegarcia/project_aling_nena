require 'sinatra'
require './boot.rb'

get '/' do
  @products = Item.all
  erb :home
end

get '/about' do
	erb :about
end

# ROUTES FOR ADMIN SECTION
get '/admin' do
  @products = Item.all
  erb :admin_index
end

get '/new_product' do
  @product = Item.new
  erb :product_form
end

post '/create_product' do
	@item = Item.new
	@item.name = params[:name]
	@item.price = params[:price]
	@item.quantity = params[:quantity]
	@item.sold = 0
	@item.save
 	redirect to '/admin'
end

get '/edit_product/:id' do
  @product = Item.find(params[:id])
  erb :product_form
end

post '/update_product/:id' do
  @product = Item.find(params[:id])
  @product.update_attributes!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
  )
  redirect to '/admin'
end

get '/delete_product/:id' do
  @product = Item.find(params[:id])
  @product.destroy!
  redirect to '/admin'
end
# ROUTES FOR ADMIN SECTION

#customer purchases
get '/products' do
	@products = Item.all
	erb :buy_index
end


get '/purchase/:id' do
	@product = Item.find(params[:id])
  	erb :buy_form
end

post '/purchase_update/:id' do
	@product = Item.find(params[:id])
	@to_sell = params[:to_sell].to_i
	@product.update_attributes!(
		quantity: @product.quantity.to_i - @to_sell,
    		sold: @product.sold.to_i + @to_sell,
  		)
	#redirect to '/payment'
	redirect to '/products'
end

#get '/payment' do
#	@product = Item.find(params[:id])
#	erb :payment_method
#end

#post '/payment' do
#	@product = Item.find(params[:id])
#	#@something = MoneyCalculator.new()
#	redirect to '/products'
#end

#customer purchases
