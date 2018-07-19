# frozen_string_literal: true

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait

  def clickbait
    errors.add(:title, "Post needs a clickbait-y title") unless clickbait?
  end

  def clickbait?
    !title.nil? && (
      title.include?("Won't Believe") ||
      title.include?("Secret") ||
      title.include?("Top") ||
      title.include?("Guess"))
  end
end
