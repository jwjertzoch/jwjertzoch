class PaymentsController < ApplicationController
  def create
    token = params[:stripeToken]
    @user = current_user
    @product = Product.find(params[:product_id])
    #Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price*100).to_i, #amount in cents
        currency: "usd",
        source: token,
        description: params[:stripeEmail],
        receipt_email: @user.email
      )

    if charge.paid
      Order.create(product_id: @product.id, user_id: @user.id, total:@product.price.to_i )
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

  end
end
