# frozen_string_literal: true

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w( Fiction Non-Fiction) }
  validate :is_clickbait?

private

  def is_clickbait?
    @clickbait =
    [/Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i]
    if @clickbait.none? { |bait| bait.match title }
      errors.add(:title, "Title must be clickbait")
    end
  end
end
