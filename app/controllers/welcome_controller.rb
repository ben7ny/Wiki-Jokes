class WelcomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@stripe_btn_data = {
  	  key: 		   "#{ Rails.configuration.stripe[:publishable_key] }",
  	  description: "Premium Membership - #{current_user.username}",
  	  amount: 	   1500
  	}
  end
end
