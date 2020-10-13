class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :work_place_of_user
      t.string :employment_status, default: "正社員"
      t.string :occupation, default: "エンジニア"
      t.timestamps
    end
  end
end
