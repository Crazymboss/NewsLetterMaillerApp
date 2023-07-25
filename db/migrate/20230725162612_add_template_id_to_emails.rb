class AddTemplateIdToEmails < ActiveRecord::Migration[7.0]
  def change
    add_column :emails, :template_id, :integer
  end
end
