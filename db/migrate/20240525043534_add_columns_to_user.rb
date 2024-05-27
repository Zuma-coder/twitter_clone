# frozen_string_literal: true

class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :phone_number
      t.date :birthdate
      t.string :username
      t.string :user_id
    end

    add_index :users, :user_id, unique: true
  end
end
