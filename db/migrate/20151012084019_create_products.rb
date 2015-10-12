class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :title, null: false
      t.boolean :available, null: false, default: false
      t.timestamps null: false
    end
  end
end
