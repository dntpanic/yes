class AddTwitterAndFacebookToPerson < ActiveRecord::Migration
  def change
    add_column :people, :twitter_url, :string
    add_column :people, :facebook_url, :string
  end
end
