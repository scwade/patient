class CreateReferenceAddresses < ActiveRecord::Migration
  def self.up
    create_table :reference_addresses do |t|
      t.integer :zip5_code,    :null => false
      t.string  :state,        :null => false,    :limit => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :reference_addresses
  end
end
