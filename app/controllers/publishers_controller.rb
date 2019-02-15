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
      flash[:success] = "Added Publisher"
      redirect_to publishers_path
    else
      flash[:info] = "Failed Add Publisher"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @publisher.update(publisher_params)
      flash[:success] = "Updated Publisher"
      redirect_to publishers_path
    else
      flash[:info] = "Failed Update Publisher"
      render 'edit'
    end
  end

  def destroy
    @publisher.destroy
    flash[:danger] = "Destroyed Publisher"
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
