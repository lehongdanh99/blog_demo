class AddViewsToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :view, :integer, default: 1
    #Ex:- :default =>''
  end
end
