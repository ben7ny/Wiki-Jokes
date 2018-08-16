class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  after_create :send_signup_confirmation_email

  after_initialize do |user|
    if user.role.nil?
      user.role = "standard"
    end
  end


  has_many :wikis

  validates :role, inclusion: { in: [
    "standard",
    "premium",
    "admin"
  ]}

  def upgrade_account
    update_attributes!(role: "premium")
  end

  def downgrade_account
    update_attributes!(role: "standard") 
    wikis.each do |wiki|
      wiki.update_attributes!(private: false)
    end
  end
 
  def admin?
    role == "admin"
  end

  def premium?
    role == "premium"
  end

  private
  def send_signup_confirmation_email
  	UserNotifier.send_signup_email(self).deliver
  end

end
