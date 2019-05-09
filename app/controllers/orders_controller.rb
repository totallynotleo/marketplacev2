class OrdersController < ApplicationController
  before_action :authenticate_user!

  include OrdersHelper
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  def add_listing
    @orders = current_user.orders
    # raise @order.inspect
    if @orders == nil
      @order = Order.create!
    else 
      @order = @orders.last
      # new_params = {user_id: current_user, shipping_address: "", listing_id: []}
    end
    raise @order.inspect

    # 1. Get the last order for the current user
    # 1.1 If no order exists, create a new one for this user
    # 2. Get the listing object with params[:listing_id]
    # 3. Add the listing object to the order
  end

def ask_duration
  
end

  # POST /orders
  # POST /orders.json
  def create
    
    @order = Order.new(order_params)
    @order.user = current_user
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :shipping_address, listing_ids: [])
    end
end
