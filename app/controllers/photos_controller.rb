class PhotosController < ApplicationController
  before_action :find_photo, only: [ :show, :edit, :update, :destroy]
  before_action :set_album

  def index
    @photo = Photo.all
  end
  
  def new
    @photo = @album.photos.new
  end
  
  def show
  end
  
  def create
    @photo = @album.photos.new photo_params
    @photo.album = @album
    if @photo.save
      redirect_to @album
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @photo.update photo_params
      redirect_to @album, notice: "Your photo was successfully saved!"
    else
      render 'edit'
    end
  end
  
  def destroy
    @photo.destroy
    redirect_to album_path, notice: "Your photo was successfully deleted!"
  end
  
  private
  
  def set_album
    @album = Album.find params[:album_id]
  end
  
  def photo_params
    params.require(:photo).permit(:album_id, :title, :gallery_image, :remove_gallery_image)
  end
  
  def find_photo
    params[:photo_id] ||= params[:id]
    @photo = Photo.find(params[:photo_id])
  end
end