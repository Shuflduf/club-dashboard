class CreateRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :roles do |t|
      #name = db.Column(db.String(50), unique=True, nullable=False, index=True)
      t.string :name, length: { maximum: 20 }, uniqueness: true, allow_nil: false

      #display_name = db.Column(db.String(100), nullable=False)
      t.string :display_name, length: { maximum: 100 }, allow_nil: false
      
      #description = db.Column(db.Text)
      t.string :description

      #is_system_role = db.Column(db.Boolean, default=False, nullable=False)  # System roles can't be deleted
      t.boolean :is_system_role, allow_nil: false

      #permissions = db.relationship('Permission', secondary='role_permission', backref='roles', lazy='dynamic')
      
      t.timestamps
    end
  end
end
