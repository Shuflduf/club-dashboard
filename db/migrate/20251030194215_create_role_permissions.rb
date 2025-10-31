class CreateRolePermissions < ActiveRecord::Migration[8.1]
  def change
    create_table :role_permissions do |t|
      # role_id = db.Column(db.Integer, db.ForeignKey('role.id'), nullable=False, index=True)
      t.references :role, null: false, foreign_key: true
      # permission_id = db.Column(db.Integer, db.ForeignKey('permission.id'), nullable=False, index=True)
      t.references :permission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
