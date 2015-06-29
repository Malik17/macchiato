class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.float :x_impact
      t.float :y_impact
      t.float :z_impact

      t.timestamps null: false
    end
  end
end
