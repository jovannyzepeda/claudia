json.array!(@stores) do |store|
  json.extract! store, :id, :user_id, :nombre, :direccion, :telefono
  json.url store_url(store, format: :json)
end
