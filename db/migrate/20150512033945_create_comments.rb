class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.refereces :post

      t.timestamps null: false
    end
  end
end
