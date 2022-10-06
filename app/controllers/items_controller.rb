class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    if params[:user_id]
      user =  User.find(params[:user_id])
      items = user.items
    else
items = item.all
    end
    render json: items, include:  :user
  end

  def show 
item = find_item
render json: item 
  end

  def create
user =  User.find(params[:user_id])
item = user.items.create(item_params)
render json:  item, status: :created
  end 



  private 

  def find_item
Item.find(params[:id])
  end
def item_params
params.permit(:name, :description, :price)
end
def render_not_found_response(invalid) 
render json: {error: "#{invalid.model} not found" }, status:  :not_found
end
  
end
