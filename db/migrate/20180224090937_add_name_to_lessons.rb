class AddNameToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :name, :string
  end
end
