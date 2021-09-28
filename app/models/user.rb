class User < ActiveRecord::Base
    has_many :user_projects, dependent: :destroy
    has_many :projects, through: :user_projects
end