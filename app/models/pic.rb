class Pic < ApplicationRecord
mount_uploader :image, ImageUploader


  # has_attached_file :image,
  #                         styles: {
  #                             large: "600x600>",
  #                             original:  { geometry: '1200x600>',
  #                                     watermark_dissolve: 30,
  #                                     watermark_distance_from_top: 90,
  #                                     watermark_path: "#{Rails.root}/public/images/large_1English.png"
  #                             }
  #                           }
  #
  #
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  # def watermark(watermark_path, options = {})
  #   ImageClipper::Image.new(avatar.path(:original)).watermarking(watermark_path, options)
  #   update_attribute(:avatar, avatar)
  # end
end
