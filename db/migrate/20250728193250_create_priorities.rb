class CreatePriorities < ActiveRecord::Migration[6.1]
  def change
    create_table :priorities do |t|
      t.string :description
      t.string :string

      t.timestamps
    end
  end
end
