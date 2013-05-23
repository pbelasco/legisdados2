class GrafosController < ApplicationController
	def index
		@parlamentares = Parlamentar.all
	end
end
