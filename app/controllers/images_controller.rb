class ImagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :html, :json

  def index
    @images = Image.scoped

    respond_with @images do |format|
      format.json { render :json => json_images(@images), :layout => false }
    end
  end

  def create
    @image = Image.new(params[:image])

    if @image.save
      render :text => view_context.image_tag(@image.image.url, :alt => '')
    else
      render :json => @image.errors
    end
  end

  private

  def json_images(images)
    json_images = []

    images.each do |image|
      json_images << {
        :thumb => resize_image(image, 120, 100).url,
        :image => image.image.url
      }
    end

    json_images
  end

  def resize_image(image, width = 100, height = 100, gravity = :c)
    image.image.process(:resize_and_crop, :width => width, :height => height, :gravity => gravity.to_s)
  end
end
