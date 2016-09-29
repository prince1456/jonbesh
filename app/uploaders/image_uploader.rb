class ImageUploader < CarrierWave::Uploader::Base
  
    include CarrierWave::RMagick
    include CarrierWave::MiniMagick

    storage :fog
    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    version :large do
        process resize_to_fit: [600, 600]
        process resize_to_fill: [600, 600]
        process :watermark
        # process :optimize_image
    end
    version :facebook do
        process resize_to_fit: [600, 315]
        process resize_to_fill: [600, 315]
        process :watermark3
    end
    version :fa do
        process resize_to_fit: [600, 600]
        process resize_to_fill: [600, 600]
        process :watermark2
        # process :optimize_image
    end
    def extension_whitelist
        %w(jpg jpeg gif png)
    end

    private

    def watermark
        manipulate! do |img|
            img = img.composite(MiniMagick::Image.open("#{Rails.root}/app/assets/images/large_1English.png"), 'large') do |c|
                c.gravity 'SouthEast'
            end
        end
     end

    def watermark3
        manipulate! do |img|
            img = img.composite(MiniMagick::Image.open("#{Rails.root}/app/assets/images/facebook.png"), 'large') do |c|
                c.gravity 'SouthEast'
            end
        end
     end

    def watermark2
        manipulate! do |img|
            img = img.composite(MiniMagick::Image.open("#{Rails.root}/app/assets/images/framFa.png"), 'large') do |c|
                c.gravity 'SouthEast'
            end
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
end
