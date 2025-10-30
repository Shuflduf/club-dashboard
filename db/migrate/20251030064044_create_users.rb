class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      # username = db.Column(db.String(80), unique=True, nullable=False, index=True)
      t.string :username, limit: 80, null: false

      # email = db.Column(db.String(120), unique=True, nullable=False, index=True)
      t.string :email, limit: 120, null: false

      # password_hash = db.Column(db.String(255), nullable=False)
      t.string :password_hash, limit: 255, null: false

      # first_name = db.Column(db.String(50))
      t.string :first_name, limit: 50

      # last_name = db.Column(db.String(50))
      t.string :last_name, limit: 50

      # birthday = db.Column(db.Date)
      t.datetime :birthday

      # last_login = db.Column(db.DateTime)
      t.datetime :last_login

      # is_suspended = db.Column(db.Boolean, default=False, nullable=False)
      t.boolean :is_suspended, default: false, null: false

      # hackatime_api_key = db.Column(db.String(255))
      t.string :hackatime_api_key, limit: 255

      # slack_user_id = db.Column(db.String(255), unique=True)
      # could maybe be indexed
      t.string :slack_user_id, limit: 255

      # identity_token = db.Column(db.String(500))
      t.string :identity_token, limit: 500

      # identity_verified = db.Column(db.Boolean, default=False, nullable=False)
      t.boolean :identity_verified, default: false, null: false

      # hide_email = db.Column(db.Boolean, default=False, nullable=False)
      t.boolean :hide_email, default: false, null: false

      # show_alias = db.Column(db.Boolean, default=False, nullable=False)
      t.boolean :show_alias, default: false, null:false

      # registration_ip = db.Column(db.String(45))  # IPv6 addresses can be up to 45 chars
      # these two could be the postgres ip type i think
      t.string :registration_ip, limit: 45

      # last_login_ip = db.Column(db.String(45))
      t.string :last_login_ip, limit: 45

      # all_ips = db.Column(db.Text)  # JSON array of all IPs used by this user
      t.string :all_ips, limit: 45, array: true

      # # RBAC relationships - specify foreign_keys to avoid ambiguity with assigned_by
      # roles = db.relationship('Role', secondary='user_role',
                             # primaryjoin='User.id==UserRole.user_id',
                             # secondaryjoin='Role.id==UserRole.role_id',
                             # backref='users', lazy='dynamic')

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
