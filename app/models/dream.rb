class Dream < ActiveRecord::Base
    belongs_to :user
    
    # validates :title, presence: true
    # validates :date, presence: true
    # validates :dream, presence: true

end
