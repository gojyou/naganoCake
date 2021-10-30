class Public::GenresController < ApplicationController


  def index
    @genres=Genre.all
    @genres = Genre.order(created_at: :desc)
  end


   private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name, :created_at, :updated_at)
  end
end
