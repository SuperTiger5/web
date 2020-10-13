class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :department
      t.string :work_place_of_user

      t.timestamps
    end
  end
end
