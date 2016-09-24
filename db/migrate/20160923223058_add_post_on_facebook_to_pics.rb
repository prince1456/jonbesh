class AddPostOnFacebookToPics < ActiveRecord::Migration[5.0]
  def change
    add_column :pics, :Post_on_facebook, :Boolean
  end
end
