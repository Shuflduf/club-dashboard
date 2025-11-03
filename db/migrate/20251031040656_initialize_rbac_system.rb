class InitializeRbacSystem < ActiveRecord::Migration[8.1]
  def change
        permissions_data = [
          # System permissions
          [ 'system.manage_roles', 'Manage Roles', 'Create, edit, and delete roles', 'system' ],
          [ 'system.manage_permissions', 'Manage Permissions', 'Assign permissions to roles', 'system' ],
          [ 'system.view_audit_logs', 'View Audit Logs', 'View system audit logs', 'system' ],
          [ 'system.manage_settings', 'Manage System Settings', 'Modify system configuration', 'system' ],

          # User management permissions
          [ 'users.view', 'View Users', 'View user list and profiles', 'users' ],
          [ 'users.create', 'Create Users', 'Create new user accounts', 'users' ],
          [ 'users.edit', 'Edit Users', 'Modify user information', 'users' ],
          [ 'users.delete', 'Delete Users', 'Delete user accounts', 'users' ],
          [ 'users.suspend', 'Suspend Users', 'Suspend and unsuspend users', 'users' ],
          [ 'users.assign_roles', 'Assign Roles', 'Assign roles to users', 'users' ],
          [ 'users.impersonate', 'Impersonate Users', 'Login as another user', 'users' ],

          # Club management permissions
          [ 'clubs.view', 'View Clubs', 'View club list and details', 'clubs' ],
          [ 'clubs.create', 'Create Clubs', 'Create new clubs', 'clubs' ],
          [ 'clubs.edit', 'Edit Clubs', 'Modify club information', 'clubs' ],
          [ 'clubs.delete', 'Delete Clubs', 'Delete clubs', 'clubs' ],
          [ 'clubs.manage_members', 'Manage Club Members', 'Add/remove club members', 'clubs' ],
          [ 'clubs.transfer_leadership', 'Transfer Club Leadership', 'Transfer club ownership', 'clubs' ],

          # Content management permissions
          [ 'content.view', 'View Content', 'View posts and projects', 'content' ],
          [ 'content.create', 'Create Content', 'Create posts and projects', 'content' ],
          [ 'content.edit', 'Edit Content', 'Edit posts and projects', 'content' ],
          [ 'content.delete', 'Delete Content', 'Delete posts and projects', 'content' ],
          [ 'content.moderate', 'Moderate Content', 'Flag and remove inappropriate content', 'content' ],

          # Review permissions
          [ 'reviews.view', 'View Reviews', 'View project reviews', 'reviews' ],
          [ 'reviews.submit', 'Submit Reviews', 'Review and approve projects', 'reviews' ],
          [ 'reviews.override', 'Override Reviews', 'Override review decisions', 'reviews' ],

          # Order review permissions
          [ 'orders.view', 'View Orders', 'View order submissions in review', 'orders' ],
          [ 'orders.approve', 'Approve Orders', 'Review and approve order status changes', 'orders' ],

          # Admin dashboard permissions
          [ 'admin.access_dashboard', 'Access Admin Dashboard', 'Access the admin dashboard', 'admin' ],
          [ 'admin.view_stats', 'View Statistics', 'View system statistics and overview', 'admin' ],
          [ 'admin.view_activity', 'View Activity Logs', 'View activity feed and system logs', 'admin' ],
          [ 'admin.manage_api_keys', 'Manage API Keys', 'Create and manage API keys', 'admin' ],
          [ 'admin.manage_oauth_apps', 'Manage OAuth Apps', 'Create and manage OAuth applications', 'admin' ],
          [ 'admin.export_data', 'Export Data', 'Export users, clubs, and other data', 'admin' ],
          [ 'admin.view_ip_groups', 'View IP Groups', 'View users grouped by IP address', 'admin' ],
          [ 'admin.reset_passwords', 'Reset User Passwords', 'Reset passwords for any user', 'admin' ],
          [ 'admin.login_as_user', 'Login As User', 'Impersonate other users (same as users.impersonate)', 'admin' ]
      ]

      permissions_data.each do |perm_name, display_name, description, category|
        Permission.find_or_create_by!(name: perm_name) do |perm|
          perm.display_name = display_name
          perm.description = description
          perm.category = category
        end
      end

      roles_data = {
        "super-admin": {
            'display_name': 'Super Administrator',
            'description': 'Full system access with all permissions',
            'is_system_role': False,  # Changed to allow editing
            'permissions': [perm for perm in permission_objects.keys()]  # All permissions
        },
        'admin': {
            'display_name': 'Administrator',
            'description': 'General administrative access',
            'is_system_role': False,  # Changed to allow editing
            'permissions': [
                'admin.access_dashboard', 'admin.view_stats', 'admin.view_activity',
                'admin.manage_api_keys', 'admin.manage_oauth_apps', 'admin.export_data',
                'admin.view_ip_groups', 'admin.reset_passwords',
                'users.view', 'users.edit', 'users.suspend', 'users.create', 'users.delete',
                'clubs.view', 'clubs.edit', 'clubs.delete', 'clubs.create', 'clubs.manage_members', 'clubs.transfer_leadership',
                'content.view', 'content.edit', 'content.delete', 'content.moderate', 'content.create',
                'reviews.view', 'reviews.submit', 'reviews.override',
                'orders.view', 'orders.approve',
                'system.view_audit_logs', 'system.manage_settings',
            ]
        },
        'users-admin': {
            'display_name': 'User Administrator',
            'description': 'Manage users and their roles',
            'is_system_role': False,  # Changed to allow editing
            'permissions': [
                'admin.access_dashboard', 'admin.view_stats', 'admin.view_ip_groups',
                'admin.reset_passwords', 'admin.export_data',
                'users.view', 'users.create', 'users.edit', 'users.suspend', 'users.assign_roles', 'users.delete',
                'system.view_audit_logs',
            ]
        },
        'reviewer': {
            'display_name': 'Reviewer',
            'description': 'Review and approve projects',
            'is_system_role': False,  # Changed to allow editing
            'permissions': [
                'admin.access_dashboard', 'admin.view_stats',
                'reviews.view', 'reviews.submit',
                'orders.view',
                'content.view',
                'clubs.view',
                'users.view',
            ]
        },
        'user': {
            'display_name': 'User',
            'description': 'Basic user with standard permissions',
            'is_system_role': False,  # Changed to allow editing
            'permissions': [
                'content.view', 'content.create',
                'clubs.view', 'clubs.create',
            ]
        },
    }
  end
end
