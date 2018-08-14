class AddLatestStripeChargeIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :latest_stripe_charge_id, :string
  end
end
