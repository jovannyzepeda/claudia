require 'test_helper'

class HistoriaEmpleadosControllerTest < ActionController::TestCase
  setup do
    @historia_empleado = historia_empleados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historia_empleados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historia_empleado" do
    assert_difference('HistoriaEmpleado.count') do
      post :create, historia_empleado: { empleado_id: @historia_empleado.empleado_id, fecha: @historia_empleado.fecha, log: @historia_empleado.log, titulo: @historia_empleado.titulo }
    end

    assert_redirected_to historia_empleado_path(assigns(:historia_empleado))
  end

  test "should show historia_empleado" do
    get :show, id: @historia_empleado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historia_empleado
    assert_response :success
  end

  test "should update historia_empleado" do
    patch :update, id: @historia_empleado, historia_empleado: { empleado_id: @historia_empleado.empleado_id, fecha: @historia_empleado.fecha, log: @historia_empleado.log, titulo: @historia_empleado.titulo }
    assert_redirected_to historia_empleado_path(assigns(:historia_empleado))
  end

  test "should destroy historia_empleado" do
    assert_difference('HistoriaEmpleado.count', -1) do
      delete :destroy, id: @historia_empleado
    end

    assert_redirected_to historia_empleados_path
  end
end
