class AddColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :ratingQuestion, :integer, default: 0
  end
end
