class Board < ActiveRecord::Base
    belongs_to :project 
    has_many :tasks, dependent: :destroy
end