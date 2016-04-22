class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados do |t|
      t.references :store, index: true, foreign_key: true
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.date :nacimiento
      t.string :puesto

      t.timestamps null: false
    end
  end
end
