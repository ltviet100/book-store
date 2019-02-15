class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
    @categories = Category.all
  end

  def show
    @categories = Category.all
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
      flash[:success] = "Added Book"
      redirect_to books_path
    else
      flash[:info] = "Failed Add Book"
      render 'new'
    end

  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:success] = "Updated Book"
      redirect_to book_path(@book)
    else
      flash[:info] = "Failed Update Book"
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    flash[:danger] = "Destroyed Book"
    redirect_to books_path
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
