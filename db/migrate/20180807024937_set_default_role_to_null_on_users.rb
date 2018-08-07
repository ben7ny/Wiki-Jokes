class SetDefaultRoleToNullOnUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :role, :string, default: nil, null: true
  end

  def down
    change_column :users, :role, :string, default: "standard", null: false
  end
end
