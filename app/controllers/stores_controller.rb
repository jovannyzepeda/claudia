class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :set_data, only: [:edit,:new]
  before_action :set_index, only: [:show]
  # GET /stores
  # GET /stores.json
  def index
    if current_user.is_admin?
      @stores = Store.all.order("user_id")
    else
      @stores = Store.where("user_id = ?", current_user.id)
    end
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end
    def set_index
      @empleados = []
      @store.empleado.each do |x|
        x.historia_empleado.limit(4).order("created_at DESC").each do  |y|
          @empleados.push([y.titulo,y.log,y.fecha,x.nombre])
        end
      end
      @empleados = @empleados.sort_by {|key,id,fecha,nombre| fecha}.reverse!
    end
    def set_data 
      @users = User.all.map {|user| [user.nombre,user.id]}
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:user_id, :nombre, :direccion, :telefono)
    end
end
