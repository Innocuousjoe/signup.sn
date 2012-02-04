class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :height
      t.string :body
      t.string :hair
      t.string :eye
      t.string :race
      t.string :occupation
      t.string :drinking
      t.string :smoking
      t.string :about
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :captcha_answer
      t.string :captcha_key

      t.timestamps
    end
  end
end
