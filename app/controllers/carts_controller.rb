class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    # render plain: LineItem.all.inspect
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
   
  end
  #  OLD CREATE METHOD MIGHT BE NEEDED
    # @cart = Cart.new(cart_params)

    # respond_to do |format|
    #   if @cart.save
    #     format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
    #     format.json { render :show, status: :created, location: @cart }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @cart.errors, status: :unprocessable_entity }
    #   end
    # end
  # end

  def add_item
    @cart = Cart.last
    @listing = Listing.find(params[:listing_id])
    LineItem.create(cart: @cart, listing: @listing)
    redirect_to @cart
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: "That cart doesn't exist"
    end

Stripe.api_key = 'sk_test_9tcFefHrg8RWT5i2rVjyoCfA00pjqGox8B'

@stripe_checkout_session = Stripe::Checkout::Session.create(
  payment_method_types: ['card'],
  line_items: [{
    name: 'test',
    description: "test",
    amount: 400,
    currency: 'aud',
    quantity: 1,
  }],
  success_url: 'https://localhost:3000/success',
  cancel_url: 'https://localhost:3000/cancel',
)
end
