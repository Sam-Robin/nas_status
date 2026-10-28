# frozen_string_literal: true

class CreateGlancesGpuMetrics < ActiveRecord::Migration[8.1]
  def change
    create_table :glances_gpu_metrics do |t|
      t.datetime :timestamp, null: false, index: true
      t.float :percent_used, null: false

      t.timestamps
    end
  end
end
