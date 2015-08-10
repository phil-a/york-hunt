class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :question_id
      t.string :correct_answer_text

      t.timestamps null: false
    end
  end
end
