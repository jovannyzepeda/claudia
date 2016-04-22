class Store < ActiveRecord::Base
  belongs_to :user
  has_many :historia_tienda
  has_many :empleado
end
