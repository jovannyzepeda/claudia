class HistoriaTiendasController < ApplicationController
  before_action :set_historia_tienda, only: [:show, :edit, :update, :destroy]
  before_action :set_tienda

  # GET /historia_tiendas
  # GET /historia_tiendas.json
  def index
    @historia_tiendas = HistoriaTienda.all
  end

  # GET /historia_tiendas/1
  # GET /historia_tiendas/1.json
  def show
  end

  # GET /historia_tiendas/new
  def new
    @historia_tienda = HistoriaTienda.new
  end

  # GET /historia_tiendas/1/edit
  def edit
  end

  # POST /historia_tiendas
  # POST /historia_tiendas.json
  def create
    @historia_tienda = HistoriaTienda.new(historia_tienda_params)
    @historia_tienda.store_id = params[:store_id]
    @historia_tienda.user_id = current_user.id
    respond_to do |format|
      if @historia_tienda.save
        Notificacion.send_email(@tienda.user,@historia_tienda, current_user, @tienda).deliver
        format.html { redirect_to @tienda, notice: 'Reporte registrado exitosamente.' }
        format.json { render :show, status: :created, location: @tienda }
      else
        format.html { render :new }
        format.json { render json: @historia_tienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historia_tiendas/1
  # PATCH/PUT /historia_tiendas/1.json
  def update
    respond_to do |format|
      if @historia_tienda.update(historia_tienda_params)
        Notificacion.send_email(@tienda.user,@historia_tienda, current_user, @tienda).deliver
        format.html { redirect_to @tienda, notice: 'Reporte Actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @tienda }
      else
        format.html { render :edit }
        format.json { render json: @historia_tienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historia_tiendas/1
  # DELETE /historia_tiendas/1.json
  def destroy
    @historia_tienda.destroy
    respond_to do |format|
      format.html { redirect_to @tienda, notice: 'Reporte eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historia_tienda
      @historia_tienda = HistoriaTienda.find(params[:id])
    end
    def set_tienda
      @tienda = Store.find(params[:store_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historia_tienda_params
      params.require(:historia_tienda).permit(:titulo, :fecha, :log)
    end
end
