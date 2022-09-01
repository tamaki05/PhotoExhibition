class AddStatusToUsers < ActiveRecord::Migration[6.1]
  # アカウントの公開・非公開設定
  def change
    add_column :users, :status, :integer, default: 1, null: false, limit: 1
  end
end
