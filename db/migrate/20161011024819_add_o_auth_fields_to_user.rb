class AddOAuthFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uid, :string
    add_column :users, :repos_url, :string
    add_column :users, :client_id, :string
    add_column :users, :client_secret, :string
  end
end
