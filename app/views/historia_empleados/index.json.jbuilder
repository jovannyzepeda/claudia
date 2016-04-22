json.array!(@historia_empleados) do |historia_empleado|
  json.extract! historia_empleado, :id, :empleado_id, :titulo, :fecha, :log
  json.url historia_empleado_url(historia_empleado, format: :json)
end
