class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.text :content
      t.string :title

      t.timestamps
    end
  end
end
