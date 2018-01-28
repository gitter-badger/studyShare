class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.references :curriculum, foreign_key: true
      t.string     :description
      t.string     :link

      t.timestamps
    end
  end
end
