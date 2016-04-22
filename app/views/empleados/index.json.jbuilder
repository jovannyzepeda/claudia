json.array!(@empleados) do |empleado|
  json.extract! empleado, :id, :store_id, :nombre, :direccion, :telefono, :nacimiento, :puesto
  json.url empleado_url(empleado, format: :json)
end
