# frozen_string_literal: true

module Api
  module V1
    class GpuMetricsController < ApplicationController
      def index
        metrics = GlancesGpuMetric.order(:timestamp)
        render json: metrics.as_json(only: %i[timestamp percent_used])
      end
    end
  end
end
