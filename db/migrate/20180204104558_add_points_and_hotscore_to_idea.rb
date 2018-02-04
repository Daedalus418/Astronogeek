class AddPointsAndHotscoreToIdea < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :points, :integer, default: 1
    add_column :ideas, :hot_score, :float, default: 0
  end
end
