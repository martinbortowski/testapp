class AlbumsController < ApplicationController
  before_action :find_album, only: [:show, :edit, :update, :destroy]
  
  def index
    @albums = Album.all.order("created_at desc")
  end
  
  def new
    @album = Album.new
  end
  
  def show
    @photo = Photo.all
  end
  
  def create
    @album = Album.new album_params
    if @album.save
      redirect_to @album
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @album.update album_params
      redirect_to @album, notice: "Your article was successfully saved!"
    else
      render 'edit'
    end
  end
  
  def destroy
    @album.destroy
    redirect_to albums_path
  end
  
  private
  
  def album_params
    params.require(:album).permit(:title, :description, :preview_image, :remove_preview_image)
  end
  
  def find_album
    @album = Album.find(params[:id])
  end
end