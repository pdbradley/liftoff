class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
