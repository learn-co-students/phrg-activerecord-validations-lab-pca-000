# frozen_string_literal: true

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :clickbait

  def clickbait
    words = [/Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/]
    errors.add(:title, "Add Clickbait") unless words.any? { |w| w.match title }
  end
end
