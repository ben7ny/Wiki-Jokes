class ChargesController < ApplicationController
  before_action :authenticate_user!

	def create

   if current_user.role == "standard"
   	# Creates a Stripe Customer object, for associating
   	# with the charge
   	customer = Stripe::Customer.create(
   	  email: current_user.email,
   	  card: 	params[:stripeToken]
   	)
  
   	# Where the real magic happens
   	charge = Stripe::Charge.create(
   	  customer: 	  customer.id, # Note -- this is NOT the user_id in your app
   	  amount:   	  1500,
   	  description: "Premium Membership - #{current_user.email}",
   	  currency: 	  'usd'
   	)
 
   	if charge.paid
   	  current_user.upgrade_account
   	  flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
	 	redirect_to root_path
   	else
   		 flash[:warn] = "there was a problem processing your payment"
   		 redirect_to root_path
   	end
	 else
	 	flash[:warn] = "there was a problem processing your payment"
   	redirect_to root_path
   end
 
   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path

	end

end
