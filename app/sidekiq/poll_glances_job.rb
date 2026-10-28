# frozen_string_literal: true

require 'net/http'
require 'json'

class PollGlancesJob
  include Sidekiq::Worker

  GLANCES_URL = ENV.fetch('GLANCES_URL', 'http://localhost:61208').freeze

  def perform
    uri = URI.parse("#{GLANCES_URL}/api/4/gpu")
    response = Net::HTTP.get_response(uri)
    return unless response.is_a?(Net::HTTPSuccess)

    data = JSON.parse(response.body)
    Array(data['gpu'] || []).each do |gpu|
      GlancesGpuMetric.create!(timestamp: Time.current, percent_used: gpu['proc'].to_f)
    end
  rescue StandardError => e
    Rails.logger.error("PollGlancesJob failed: #{e.message}")
  end
end
