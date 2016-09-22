class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  include CarrierWave::MiniMagick
    # process :resize_to_fit => [800, 600]
    # process :resize_to_fill => [850, 315]
    # process :convert => 'png'


  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog
  # process :convert => 'png'
  # process :watermark

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end




  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   process scale: [600, 600]
  # end

  # Create different versions of your uploaded files:
  version :large do
    process resize_to_fit: [600, 600]
    process resize_to_fill: [600,600]
    process :watermark
    process :optimize_image
  end
    # process :resize_to_fill => [600, 600]

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end



private




def watermark
   manipulate! do |img|
     img = img.composite(MiniMagick::Image.open("#{Rails.root}/app/assets/images/large_1English.png"), "large") do |c|
       c.gravity "SouthEast"
     end


    #  watermark = MiniMagick::Image.open("#{Rails.root}/app/assets/images/large_1English.png")
    #
    #  draw = Magick::Draw.new
    #
    #  draw.annotate(watermark, 0, 0, 0, 0, "creative commons") do
    #   # place the text in the centre of the canvas;
    #   draw.gravity = Magick::CenterGravity;
    #   # set text height in points where 1 point is 1/72 inches;
    #   draw.pointsize = 100;
    #   draw.font_family = "Times" # set font;
    #   draw.fill = "white" # set text color;
    #   draw.stroke = "none" # remove stroke;
    # end
    #
    #  img = img.composite(watermark, "large") do |c|
    #    c.gravity "SouthEast"
    #  end
   end
 end

 def optimize_image
  manipulate! do |img|
    img.format('JPEG')
    img = img.auto_orient
    img = img.quality 80
    img
  end
end
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
