module PermissionsConcern
	#es para agergar tiposdeusuarios yu permisos
	extend ActiveSupport::Concern
	def is_normal_user?
		self.tipo >= 1
	end
	def is_admin?
		self.tipo >= 2
	end
end