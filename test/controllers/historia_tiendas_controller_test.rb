require 'test_helper'

class HistoriaTiendasControllerTest < ActionController::TestCase
  setup do
    @historia_tienda = historia_tiendas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historia_tiendas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historia_tienda" do
    assert_difference('HistoriaTienda.count') do
      post :create, historia_tienda: { fecha: @historia_tienda.fecha, log: @historia_tienda.log, store_id: @historia_tienda.store_id, titulo: @historia_tienda.titulo }
    end

    assert_redirected_to historia_tienda_path(assigns(:historia_tienda))
  end

  test "should show historia_tienda" do
    get :show, id: @historia_tienda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historia_tienda
    assert_response :success
  end

  test "should update historia_tienda" do
    patch :update, id: @historia_tienda, historia_tienda: { fecha: @historia_tienda.fecha, log: @historia_tienda.log, store_id: @historia_tienda.store_id, titulo: @historia_tienda.titulo }
    assert_redirected_to historia_tienda_path(assigns(:historia_tienda))
  end

  test "should destroy historia_tienda" do
    assert_difference('HistoriaTienda.count', -1) do
      delete :destroy, id: @historia_tienda
    end

    assert_redirected_to historia_tiendas_path
  end
end
