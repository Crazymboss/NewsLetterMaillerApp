class AddHeaderFooterBodyPlaceholderToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :templates, :header, :text
    add_column :templates, :footer, :text
    add_column :templates, :body_placeholder, :text
  end
end
