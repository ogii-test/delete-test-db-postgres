# frozen_string_literal: true

class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    User.first.update!(username: "stringer") if User.any?
    change_column_null :users, :username, false
  end
end
