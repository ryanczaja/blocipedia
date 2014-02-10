class WikisController < ApplicationController
  def index
  	@wikis = Wiki.all
  end

	def new
		@wiki = Wiki.new
    authorize! :create, Wiki, message: "You need to be a member to create a new Wiki."
  end

  def show
  	@wiki = Wiki.find(params[:id])
  end

  def create
  	@wiki = current_user.wikis.build(params[:wiki])
    authorize! :create, @wiki, message: "You need to be signed in to do that."
  	if @wiki.save
  		flash[:notice] = "Wiki was saved."
  		redirect_to @wiki
  	else
  		flash[:error] = "There was a problem saving the Wiki. Please try again."
  		render :new
  	end
  end

  def edit
  	@wiki = Wiki.find(params[:id])
    authorize! :edit, @wiki, message: "You need to own the Wiki to edit it."
  end

  def update
  	@wiki = Wiki.find(params[:id])
    authorize! :edit, @wiki, message: "You need to own the Wiki to edit it."
  	if @wiki.update_attributes(params[:wiki])
  		flash[:notice] = "Wiki was updated."
  		redirect_to @wiki
  	else
  		flash[:error] = "There was a problem updating the Wiki. Please try again."
  		render :edit
  	end
  end
end
