class ChargesController < ApplicationController
  # before_action :set_search, only: [:show, :edit, :update, :destroy]

def new
end

def create
  @charge = Charge.new(charge_params)
  if @charge.save
    respond_to do |format|
        format.html { redirect_to dashboard_path } #, notice: 'Charge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @charge }
    end
  else
    respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
    end
  end

  # Amount in cents
  @amount = 500
  Stripe.api_key = ENV["API_KEY"]
  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

private
  def charge_params
    {stripeToken: params[:stripeToken], stripeTokenType: params[:stripeTokenType], stripeEmail: params[:stripeEmail]}
  end
end

  
  