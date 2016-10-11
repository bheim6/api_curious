class AddOAuthFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :token, :string
  end
end
