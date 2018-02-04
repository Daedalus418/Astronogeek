class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.text :title
      t.text :description
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
