class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body
      t.Question :post

      t.timestamps null: false
    end
  end
end
