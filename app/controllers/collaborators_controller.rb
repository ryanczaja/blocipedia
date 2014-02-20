class CollaboratorsController < ApplicationController
  def new
  	@collaborator = Collaborator.new
  end

  def create
  	@collaborator = Collaborator.new(params[:collaborator])
  	
  	if @collaborator.save 
  		redirect_to :back
  	end
  end
end

