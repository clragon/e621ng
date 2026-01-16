# frozen_string_literal: true

class RenameCommentsIsHiddenToIsDeleted < ActiveRecord::Migration[7.2]
  def change
    rename_column :comments, :is_hidden, :is_deleted
  end
end
