class PhotosController < ApplicationController
  before_filter :authenticate_admin!, :only => [:new, :create, :edit, :update, :destroy]
  protect_from_forgery :except => :create #!!!
  def index
    @photos = Photo.all
    @gallery = Gallery.find(params[:gallery_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end
  def new
    @photo = Photo.new
    @gallery = Gallery.find(params[:gallery_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end
  def create
    @photo = Photo.new(:image => params[:Filedata])
    respond_to do |format|
      if @photo.save
        format.html { redirect_to gallery_photos_path(@photo.gallery), notice: 'Photo was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.json 
      end
    end
  end
  def destroy
    @photo = Photo.find(params[:id])
    gallery = @photo.gallery
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to gallery_photos_path(gallery) }
      format.json { head :no_content }
    end
  end
end
