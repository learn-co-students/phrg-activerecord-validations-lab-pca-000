# frozen_string_literal: true

class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.present? &&
           (record.title.include?("Won't Believe") ||
           record.title.include?("Secret") ||
           record.title.include?("Top [number]") ||
           record.title.include?("Guess"))
      record.errors[:name] << "Gotta be click-bait, cmon now!"
    end
  end
end
