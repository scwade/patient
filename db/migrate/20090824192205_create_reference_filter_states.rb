class CreateReferenceFilterStates < ActiveRecord::Migration
  def self.up
    create_table :reference_filter_states do |t|
      t.string  :state,            :null => false,    :limit => 2
      t.string  :description,      :null => false,    :limit => 60

      t.timestamps
    end
  end

  def self.down
    drop_table :reference_filter_states
  end
end
