class Master < ApplicationRecord
  validates :file_name, {presence: true}
  # validates :user_name, {presece: true}
end
