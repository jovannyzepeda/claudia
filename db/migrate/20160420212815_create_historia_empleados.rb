class CreateHistoriaEmpleados < ActiveRecord::Migration
  def change
    create_table :historia_empleados do |t|
      t.references :empleado, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :titulo
      t.date :fecha
      t.text :log

      t.timestamps null: false
    end
  end
end
