class RefundsController < ApplicationController
  before_action :authenticate_user!

	def create
      if current_user.role == "premium"
   
      	# Where the real magic happens
      	refund = Stripe::Refund.create(
            charge: current_user.latest_stripe_charge_id
      	)
   
      	if refund.status == "succeeded"
      	  current_user.downgrade_account
      	  flash[:notice] = "sorry to see you go :("
	   	  redirect_to root_path
      	else
      	  flash[:warn] = "there was a problem processing your refund"
      	  redirect_to root_path
      	end
	   else
	   	flash[:warn] = "there was a problem processing your refund"
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
