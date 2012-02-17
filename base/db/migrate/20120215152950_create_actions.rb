class CreateActions < ActiveRecord::Migration
  def up
    create_table :actions do |t|
      t.references :actor
      t.references :activity_object

      t.timestamps
    end

    add_index :actions, :actor_id
    add_index :actions, :activity_object_id

    add_foreign_key "actions", "actors", :name => "index_actions_on_actor_id"
    add_foreign_key "actions", "activity_objects", :name => "index_actions_on_activity_object_id"
  end

  def down
    remove_foreign_key "actions", :name => "index_actions_on_actor_id"
    remove_foreign_key "actions", :name => "index_actions_on_activity_object_id"

    drop_table :actions
  end
end
