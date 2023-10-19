class CreateTimeTables < ActiveRecord::Migration[7.0]
  def change
    create_table :time_tables do |t|

      t.timestamps
    end
  end
end
