class CreatePermissions < ActiveRecord::Migration[8.1]
  def change
    create_table :permissions do |t|
      # name = db.Column(db.String(100), unique=True, nullable=False, index=True)
      t.string :name, limit: 100, null: false

      # display_name = db.Column(db.String(150), nullable=False)
      t.string :display_name, limit: 150, null: false

      # description = db.Column(db.Text)
      t.text :description

      # category = db.Column(db.String(50), nullable=False, index=True)  # users, clubs, content, system, etc.
      # could be enum
      t.string :category, limit: 50, null: false


      t.timestamps
    end

    add_index :permissions, :name, unique: true
    add_index :permissions, :category
  end
end
