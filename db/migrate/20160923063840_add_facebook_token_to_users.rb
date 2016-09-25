class AddFacebookTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :facebook_token, :string
    add_column :users, :facebook_expire_at, :string
  end
end
