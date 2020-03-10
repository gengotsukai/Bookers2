class BookController < ApplicationController
	def index
		@books = Book.all
	end
	def create
	end
end
