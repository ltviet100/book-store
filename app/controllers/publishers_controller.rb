class PublishersController < ApplicationController
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
  end

  def destroy
  end

  private
    def publisher_params
      params.require(:publisher).permit(:name)
    end
end
