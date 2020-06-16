class CreateNotificationTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_templates do |t|
      t.text :body
      t.string :path
      t.string :locale
      t.string :handler
      t.boolean :partial
      t.string :format

      t.timestamps
    end
  end
end
