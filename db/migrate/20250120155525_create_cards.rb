class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.references :user, null: false, index: true
      t.string :card_type, null: false
      t.integer :number, null: false
      t.integer :balance, null: false

      t.timestamps
    end
  end
end
