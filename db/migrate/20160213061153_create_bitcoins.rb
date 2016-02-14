class CreateBitcoins < ActiveRecord::Migration
  def change
    create_table :bitcoins do |t|
      t.string :company
      t.string :last

      t.timestamps null: false
    end
  end
end
