class Template < ApplicationRecord
    validates :name, presence: true
    validates :header, presence: true
    validates :footer, presence: true
end
