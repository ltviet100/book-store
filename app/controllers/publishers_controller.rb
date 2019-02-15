class PublishersController < ApplicationController
  before_action :set_publisher, only: [:show, :edit, :update, :destroy]
  def index
    @publishers = Publisher.all
  end

  def show
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:notice] = "Added publisher"
      redirect_to publishers_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @publisher.update(publisher_params)
      flash[:notice] = "Updated Publisher"
      redirect_to publishers_path
    else
      render 'edit'
    end
  end

  def destroy
    @publisher.destroy
    flash[:notice] = "Destroyed Publisher"
    redirect_to publishers_path
  end

  private
    def publisher_params
      params.require(:publisher).permit(:name)
    end

    def set_publisher
      @publisher = Publisher.find(params[:id])
    end
end
