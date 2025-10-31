class CreateRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :roles do |t|
      # name = db.Column(db.String(50), unique=True, nullable=False, index=True)
      t.string :name, limit: 50, null: false

      # display_name = db.Column(db.String(100), nullable=False)
      t.string :display_name, limit: 100, null: false

      # description = db.Column(db.Text)
      t.text :description

      # is_system_role = db.Column(db.Boolean, default=False, nullable=False)  # System roles can't be deleted
      t.boolean :is_system_role, default: false, null: false

      # permissions = db.relationship('Permission', secondary='role_permission', backref='roles', lazy='dynamic')

      t.timestamps
    end

    add_index :roles, :name, unique: true
  end
end
