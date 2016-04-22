class AdminsController < ApplicationController
  before_action :set_user
  before_action :autenticacion_normal
  before_action :first_user
  before_action :is_loggin

  # GET /admins
  # GET /admins.json
  def index
    @users = User.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @user = User.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @pass = params[:password]
    @user = User.new(user_params)
    @user.password = "sydti123456"
    @user.password_confirmation = "sydti123456"
    unless @first_user.present?
      @user.tipo = 2
    end
    if @user.save
      Notificacion.bienvenida(@user,@pass).deliver
      flash[:notice] = "Usuario creado correctamente." 
      unless @first_user.present?
        redirect_to root_path
      end
      unless @first_user.blank?
        redirect_to admins_path
      end
      
    else
      flash[:notice] = "Datos Erroneos o password menor a 8 caracteres"
      render :action => 'new'
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
        unless @first_user.present?
          @user.tipo = 2
        end
        if @user.update(user_params)
          flash[:notice] = "Usuario actualizado correctamente." 
          unless @first_user.present?
            redirect_to root_path
          end
          unless @first_user.blank?
            redirect_to admins_path
          end
          
        else
          flash[:notice] = "Datos Erroneos o password menor a 8 caracteres"
          render :action => 'new'
        end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Usuario destruido exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find_by(id: params[:id])
    end

    def first_user
      @first_user = User.first
    end 
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :tipo, :nombre)
    end
end
