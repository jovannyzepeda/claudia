class Notificacion < ApplicationMailer
	default from: "zepeda.roque32@gmail.com"
	def send_email(user,elemento,user_actual,tienda)
	    @user = user
	    @tienda = tienda
	    @user_actual = user_actual
	    @elemento = elemento
	    if user_actual.is_admin?
	    	mail( :to => user.email,
	    	:subject => 'Levantamiento de reporteen tienda' )
		else
			mail( :to => "zepeda.roque32@gmail.com",
	    	:subject => 'Levantamiento de reporte en tienda' )
		end
	end

	def bienvenida(user,password)
		@user = user
	    @password = password
			mail( :to => user.email,
	    	:subject => 'Bienvenido a Sydti Network' )
	end
	def noticia_user(user,elemento,user_actual,tienda,empleado)
	    @user = user
	    @tienda = tienda
	    @user_actual = user_actual
	    @elemento = elemento
	    @empleado = empleado
	    if user_actual.is_admin?
	    	mail( :to => user.email,
	    	:subject => 'Levantamiento de reporte para empleado' )
		else
			mail( :to => "zepeda.roque32@gmail.com",
	    	:subject => 'Levantamiento de reporte para empleado' )
		end
	end
end
