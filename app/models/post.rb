# frozen_string_literal: true

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Non-Fiction Fiction] }

  validate :click_bait

private

  def click_bait
    errors.add(:base, "Not valid") unless click_bait?
  end

  def click_bait?
    title.present? &&
      (title.include?("Won't Believe") ||
      title.include?("Secret") ||
      title.include?("Top [number]") ||
      title.include?("Guess"))
  end
end
