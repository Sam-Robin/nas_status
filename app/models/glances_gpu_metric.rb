# frozen_string_literal: true

class GlancesGpuMetric < ApplicationRecord
  validates :timestamp, presence: true
  validates :percent_used, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
