class SimplePagesController < ApplicationController

  def index
  end

  def landing_page
    #@featured_product = Product.first
    @products = Product.products_with_images.limit(3)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]

    ActionMailer::Base.mail(
      from: @email,
      to: 'jenny_wjertzoch@yahoo.de',
      subject: "A new contact form message from #{@name}",
      body: @message).deliver_now
  end
end
