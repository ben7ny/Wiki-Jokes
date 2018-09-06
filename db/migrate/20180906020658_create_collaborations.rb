class CreateCollaborations < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborations do |t|
      t.references :wiki, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
