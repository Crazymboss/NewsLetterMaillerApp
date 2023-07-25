class RemoveBodyFromTemplates < ActiveRecord::Migration[7.0]
  def change
    remove_column :templates, :body, :text
  end
end
