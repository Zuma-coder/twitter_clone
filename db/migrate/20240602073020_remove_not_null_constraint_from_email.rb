# frozen_string_literal: true

class RemoveNotNullConstraintFromEmail < ActiveRecord::Migration[7.0]
  def up
    change_column_null :users, :email, true
  end

  def down
    change_column_null :users, :email, false
  end
end
