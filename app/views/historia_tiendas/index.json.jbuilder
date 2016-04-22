json.array!(@historia_tiendas) do |historia_tienda|
  json.extract! historia_tienda, :id, :store_id, :titulo, :fecha, :log
  json.url historia_tienda_url(historia_tienda, format: :json)
end
