class WikisController < ApplicationController
  def index
  	@wikis = Wiki.visible_to(current_user).paginate(page: params[:page], per_page: 10)
  end

	def new
		@wiki = Wiki.new
    authorize! :create, Wiki, message: "You need to be a member to create a new Wiki."
  end

  def show
  	@wiki = Wiki.find(params[:id])
    authorize! :read, @wiki, message: "You need to be a premium member to do that."
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

  def destroy
    @wiki = Wiki.find(params[:id])
    name = @wiki.title
    authorize! :destroy, @wiki, message: "You need to own the Wiki to delete it."
    if @wiki.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the wiki."
      render :show
    end
  end
end
