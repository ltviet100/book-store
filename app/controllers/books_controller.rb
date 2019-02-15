class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
    @category = Category.new
    @author = Author.new
    @publisher = Publisher.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Added Book"
      redirect_to books_path
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
    def book_params
      params.require(:book).permit(:title, :isbn, :author_id, :category_id,
                    :publisher_id, :format, :excerpt, :page, :price, :year,
                    :buy_link, :image )
    end

    def set_book
      @book = Book.find(params[:id])
    end
end
