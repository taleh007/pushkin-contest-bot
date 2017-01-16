class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :question
      t.integer :task_id
      t.integer :level
      t.float :resolve_time

      t.timestamps
    end
  end
end
