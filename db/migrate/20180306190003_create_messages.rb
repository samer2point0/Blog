class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :sender_id
      t.string :reciever_id
      t.string :topic
      t.string :body
      t.timestamps
    end

    add_index :messages, :sender_id
    add_index :messages, :reciever_id 
  end
end
