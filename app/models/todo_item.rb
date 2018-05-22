class TodoItem < ApplicationRecord
  include Sortable
  
  belongs_to :todo
  has_one :user, through: :todo

  enum priority: { high: 0, medium: 1, low: 2 }
  enum status: { active: 0, completed: 1 }

  validates :text, presence: true, 
    length: { minimum: 2, maximum: 1000 }

  scope :from_due_at, -> (from) { where('due_at >= ?', from) if from.present? }
  scope :to_due_at,   -> (to) { where('due_at <= ?', to) if to.present? }
  scope :by_priority, -> (priority) { where(priority: priority) if priority.present? }
end
