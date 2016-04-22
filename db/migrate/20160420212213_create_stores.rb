class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.references :user, index: true, foreign_key: true
      t.string :nombre
      t.string :direccion
      t.string :telefono

      t.timestamps null: false
    end
  end
end
