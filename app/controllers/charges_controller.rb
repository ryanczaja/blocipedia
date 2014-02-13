class ChargesController < ApplicationController
	def new
	end

	def create
		@amount = 500

		customer = Stripe::Customer.create(
			:email => 'test@email.com',
			:card => params[:stripeToken])

		charge = Stripe::Charge.create(
			:customer => customer.id,
			:amount => @amount,
			:description => 'Rails Stripe Customer',
			:currency => 'usd')

		current_user.upgradeToPremium 

		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to charges_path
	end
end
