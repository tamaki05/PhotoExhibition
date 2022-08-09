class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :user_id
      t.integer :exhibition_id
      t.text :message

      t.timestamps
    end
  end
end
