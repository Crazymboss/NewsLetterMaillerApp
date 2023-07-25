class RemoveBodyPlaceholderFromTemplates < ActiveRecord::Migration[7.0]
  def change
    remove_column :templates, :body_placeholder, :text
  end
end
