class AddForeignKeyToQuestionAndAnswerFromUser < ActiveRecord::Migration
  def change
    add_foreign_key :questions, :users, column: :user_id, primary_key: "id"
    add_foreign_key :answers, :users, column: :user_id, primary_key: "id"
    add_foreign_key :answers, :questions, column: :question_id, primary_key: "id"
  end
end
