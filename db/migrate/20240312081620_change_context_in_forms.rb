class ChangeContextInForms < ActiveRecord::Migration[7.1]
  def change
    change_column :journal_entries, :content, :text
  end
end
