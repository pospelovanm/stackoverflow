class AddColumnToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :ratingAnswer, :integer, default: 0
  end
end
