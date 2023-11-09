class BooksController < ApplicationController
    def index
        @user = current_user
        @books = Book.all
        @book = Book.new
        @users = User.all
    end
    def show
        @book = Book.find(params[:id])
        @user = @book.user
        @books = Book.all
    end
    def new
        @book = Book.new
    end
    def create
        @user = current_user
        @book = Book.new(book_params)
        @book.user_id = current_user.id
       if @book.save
        redirect_to book_path(@book.id), notice: "Book created successfully."
       else
        @books = Book.all
        render 'index'
        
       end
    end
    def edit
        @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
         redirect_to book_path(@book.id)
         flash[:notice] = "Book was successfully updated."
        else
         render 'edit'
        end
    end
    def destroy
       @book = Book.find(params[:id])
       @book.destroy
       redirect_to books_url, notice: 'Book was successfully destroyed.'
    end
    def set_book
       @book = Book.find(params[:id])
    end

 private

    def book_params
       params.require(:book).permit(:title, :body)
    end
end    

