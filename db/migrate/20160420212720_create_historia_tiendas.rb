class CreateHistoriaTiendas < ActiveRecord::Migration
  def change
    create_table :historia_tiendas do |t|
      t.references :store, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :titulo
      t.date :fecha
      t.text :log

      t.timestamps null: false
    end
  end
end
