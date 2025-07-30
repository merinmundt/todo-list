class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :employee, null: false, foreign_key: true
      t.string :description
      t.references :priority, null: false, foreign_key: true
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
