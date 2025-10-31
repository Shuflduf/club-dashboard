class CreateUserRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :user_roles do |t|
      # user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False, index=True)
      t.references :user, null: false, foreign_key: true

      # role_id = db.Column(db.Integer, db.ForeignKey('role.id'), nullable=False, index=True)
      t.references :role, null: false, foreign_key: true

      # assigned_by = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=True)
      t.references :assigner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
