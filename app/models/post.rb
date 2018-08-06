# frozen_string_literal: true

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :not_clickbait

  def not_clickbait
    return if title =~ /Won't Believe|Secret|Top \d|Guess/
    errors.add(:title, "is clickbait")
  end
end

# def not_clickbait
#   if !self.title.match(/Won't Believe|Secret|Top \d|Guess/)
#     errors.add(:title, "is clickbait")
#   end
# end

# def not_clickbait
#   if !/Won't Believe|Secret|Top \d|Guess/.match(title)
#     errors.add(:title, "is clickbait")
#   end
# end

# def not_clickbait
#   unless title =~ /Won't Believe|Secret|Top \d|Guess/
#   errors.add(:title, "is clickbait")
# end
