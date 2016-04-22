class Empleado < ActiveRecord::Base
  belongs_to :store
  has_many :historia_empleado
  has_attached_file :foto, styles: {medium: "500x500"}
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\Z/
end
