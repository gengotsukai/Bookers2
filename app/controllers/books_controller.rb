class BooksController < ApplicationController
	def index
		@books = Book.all
		@user = current_user
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@books = @user.books
	end
	
	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book.id) #flash: { notice: 'You have updated user successfully.' }
		else
			render :edit
		end
	end

	def create
		@user = User.all
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book.id)
		else
			@books = Book.all
			render :index
		end
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end
end
