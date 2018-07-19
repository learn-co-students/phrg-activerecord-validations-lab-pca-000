# frozen_string_literal: true

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :clickbait?

private

  def clickbait?
    @clickbait =
      [/Won't Believe/i,
       /Secret/i,
       /Top [0-9]*/i,
       /Guess/i]
    return unless @clickbait.none? { |bait| bait.match title }
    errors.add(:title, "Title must be clickbait")
  end
end
