class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  def index
    @authors = Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end

  def create
        @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Added author"
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      flash[:notice] = "Updated Author"
      redirect_to authors_path
    else
      render 'edit'
    end
  end

  def destroy
    @author.destroy
    flash[:notice] = "Destroyed Author"
    redirect_to authors_path
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name)
    end

    def set_author
      @author = Author.find(params[:id])
    end
end
