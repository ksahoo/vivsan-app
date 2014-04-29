class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column "firstname", :string
      t.column "lastname", :string
      t.column "email", :string
      t.column "institution" :string
      t.column "password", :string
      t.timestamps
    end
  end
end
