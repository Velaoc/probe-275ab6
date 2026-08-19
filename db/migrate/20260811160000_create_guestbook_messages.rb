class CreateGuestbookMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :guestbook_messages do |t|
      t.string :name
      t.text :body, null: false

      t.timestamps
    end
  end
end
