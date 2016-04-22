class AddAttachmentFotoToEmpleados < ActiveRecord::Migration
  def self.up
    change_table :empleados do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :empleados, :foto
  end
end
