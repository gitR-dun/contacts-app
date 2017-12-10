class AddMiddleNameToContacts < ActiveRecord::Migration[5.1]
  def change
            # table name column name  data type
    add_column :contacts, :middle_name, :string
  end
end
