class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.belongs_to :product
      t.decimal :amount, null: false, default: 0.0
      t.boolean :legitimate, null: false, default: false
      t.timestamps null: false
    end
  end
end
