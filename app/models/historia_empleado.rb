class HistoriaEmpleado < ActiveRecord::Base
  belongs_to :empleado
  belongs_to :user
end
