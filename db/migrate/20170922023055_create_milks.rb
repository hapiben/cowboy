class CreateMilks < ActiveRecord::Migration[5.1]
  def change
    create_table :milks do |t|
      t.string :name

      t.timestamps
    end
  end
end
