class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.integer :owner_id, null: false
      t.integer :recipient_id, null: false
      t.timestamps
    end
  end
end