# frozen_string_literal: true

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 150 }
  validates :summary, length: { maximum: 152 }
  validates :category, inclusion: { in: %w[Fiction] }
  include ActiveModel::Validations
  validates_with MyValidator
end
