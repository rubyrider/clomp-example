class AddPointsToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :point, :integer, default: 0
  end
end
