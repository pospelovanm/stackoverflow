class ChangeTypeOfColumn < ActiveRecord::Migration
  def change
    change_column :questions, :contentQuestion,  :text
  end
end
