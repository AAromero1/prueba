class AddAdminToSpecificUser < ActiveRecord::Migration[6.0]
  def up
    user = User.find_by(email: 'admin@gmail.com')
    user.update(admin: true) if user.present?
  end

  def down
    user = User.find_by(email: 'admin@gmail.com')
    user.update(admin: false) if user.present?
  end
end

