class HistoriaEmpleadosController < ApplicationController
  before_action :set_historia_empleado, only: [:show, :edit, :update, :destroy]
  before_action :set_data
  # GET /historia_empleados
  # GET /historia_empleados.json
  def index
    @historia_empleados = HistoriaEmpleado.all
  end

  # GET /historia_empleados/1
  # GET /historia_empleados/1.json
  def show
  end

  # GET /historia_empleados/new
  def new 
    @historia_empleado = HistoriaEmpleado.new
  end

  # GET /historia_empleados/1/edit
  def edit
  end

  # POST /historia_empleados
  # POST /historia_empleados.json
  def create
    @historia_empleado = HistoriaEmpleado.new(historia_empleado_params)
    @historia_empleado.empleado_id = @empleado.id
    @historia_empleado.user_id = current_user.id
    respond_to do |format|
      if @historia_empleado.save
        Notificacion.noticia_user(@tienda.user,@historia_empleado,
         current_user, @tienda,@empleado).deliver
        format.html { redirect_to [@tienda,@empleado], 
          notice: 'Historia Creada corretamente' }
        format.json { render :show, status: :created, location: [@tienda,@empleado] }
      else
        format.html { render :new }
        format.json { render json: @historia_empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historia_empleados/1
  # PATCH/PUT /historia_empleados/1.json
  def update
    respond_to do |format|
      if @historia_empleado.update(historia_empleado_params)
        Notificacion.noticia_user(@tienda.user,@historia_empleado,
         current_user, @tienda,@Empleado).deliver
        format.html { redirect_to [@tienda,@empleado] , notice: 'Historia actualizada correctamente' }
        format.json { render :show, status: :ok, location: [@tienda,@empleado]  }
      else
        format.html { render :edit }
        format.json { render json: @historia_empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historia_empleados/1
  # DELETE /historia_empleados/1.json
  def destroy
    @historia_empleado.destroy
    respond_to do |format|
      format.html { redirect_to [@tienda,@empleado], notice: 'Reporte de empleado eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historia_empleado
      @historia_empleado = HistoriaEmpleado.find(params[:id])
    end
    def set_data
      @tienda = Store.find(params[:store_id])
      @empleado = Empleado.find(params[:empleado_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def historia_empleado_params
      params.require(:historia_empleado).permit(:titulo, :fecha, :log)
    end
end
