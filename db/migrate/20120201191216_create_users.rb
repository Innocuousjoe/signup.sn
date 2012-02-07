class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :sex
      t.string :sex_seeking
      t.integer :birthday_month
      t.integer :birthday_day
      t.integer :birthday_year
      t.string :country
      t.integer :zipcode
      t.string :captcha_key
      t.string :captcha_answer
      t.string :height
      t.string :body
      t.string :hair
      t.string :eye
      t.string :race
      t.string :occupation
      t.string :drinking
      t.string :smoking
      t.string :about
      t.integer :city_id

      t.timestamps
    end
  end
end
