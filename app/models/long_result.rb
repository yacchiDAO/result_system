# frozen_string_literal: true

class LongResult < ApplicationRecord
  belongs_to :athlete, optional: true
  belongs_to :tournament, optional: true
  # belongs_to :competition, optional: true

  before_save :set_grade

  private

  def set_grade
    self.grade = athlete.grade if grade.blank?
  end
end
