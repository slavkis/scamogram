class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :chat, foreign_key: true
      t.string :body
      t.timestamps
    end
  end
end