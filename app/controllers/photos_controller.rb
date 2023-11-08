class PhotosController < ActionController::Base
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})
    render({ :template => "photo_templates/index" })
  end 

  def add 
    p=Photo.new
    p.image = params.fetch("input_image")
    p.caption = params.fetch("input_caption")
    p.owner_id = params.fetch("input_owner_id")
    p.save 

    redirect_to("/photos/#{p.id}")
  end 

  def show
    url_id = params.fetch("photo_id")
    matching_photos = Photo.where({:id => url_id})

    @the_photo = matching_photos.first


    render({ :template => "photo_templates/show" })
  end 

  def destroy
    the_id = params.fetch("toast_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy

    redirect_to("/photos")

  end 

  def update
    
    the_id = params.fetch("update_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)

    the_photo.image = params.fetch("input_image")
    the_photo.caption = params.fetch("input_caption")

    the_photo.save
    redirect_to("/photos/#{the_photo.id}")
  end 

  def comment
    photo_id = params.fetch("photo_id")

    c=Comment.new
    c.photo_id = params.fetch("input_photo_id")
    c.author_id = params.fetch("input_author_id")
    c.body = params.fetch("input_comment")
    c.save 

    redirect_to("/photos/#{photo_id}")

  end 


end
