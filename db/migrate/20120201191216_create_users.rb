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
      t.integer :height
      t.integer :body
      t.integer :hair
      t.integer :eye
      t.integer :race
      t.integer :occupation
      t.integer :drink
      t.integer :smoke
      t.integer :about
      t.integer :city_id

      t.timestamps
    end
  end
end
