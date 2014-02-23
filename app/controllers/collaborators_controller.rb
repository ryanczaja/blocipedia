class CollaboratorsController < ApplicationController
  def new
  	@collaborator = Collaborator.new
  end

  def create
    
    if params[:access] == "1"
      @collaborator = Collaborator.new(params[:collaborator].merge(wiki_id: params[:wiki_id]))
    end
  	if @collaborator && @collaborator.save 
  		return redirect_to :back
  	end
    flash[:error] = 'You canz no do this'
    redirect_to :back
  end
end

