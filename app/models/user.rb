class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_signup_confirmation_email


  private
  def send_signup_confirmation_email
  	UserNotifier.send_signup_email(self).deliver
  end

end