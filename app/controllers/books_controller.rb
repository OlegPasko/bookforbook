class BooksController < ApplicationController
  has_scope :keywords
  
  def search
    @books = params[:search] ? apply_scopes(Book, params[:search]) : []
    respond_to do |format|
        format.html { render action: "search" }
        format.js
    end
  end
  # POST /pages
  # POST /pages.json
  def create
    @book = Book.new(params[:book])
    @book.user = current_user
    respond_to do |format|
      if @book.save
        format.html { redirect_to root_url, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to :back, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
