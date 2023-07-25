class Email < ApplicationRecord
    belongs_to :template
    validates :subject, presence: true
    validates :body, presence: true
end
