class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :message

      t.timestamps
    end
    
    100.times do
      User.create! do |u|
        u.first_name = Faker::Name.first_name
        u.last_name = Faker::Name.last_name 
        u.email = Faker::Internet.email 
        u.message = Faker::Lorem.paragraph
        puts "create user #{u.email} "
      end
    end

  end

  def self.down
    drop_table :users
  end
end
