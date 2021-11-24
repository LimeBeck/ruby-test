class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :edit_count, numericality: { greater_than_or_equal_to: 0, less_than: 5 }

  after_validation :increase_count, on: [:update]

  before_validation do
    self.edit_count = 0 if edit_count.nil?
  end

  private

  def increase_count
    self.edit_count = edit_count + 1
  end
end
