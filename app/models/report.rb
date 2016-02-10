class Report < ActiveRecord::Base
  include RailsAdminCharts

  def self.graph_data since=30.days.ago
    [
      {
          name: 'Admin',
          pointInterval: point_interval = 1.day * 1000,
          pointStart: start_point = since.to_i * 1000,
          data: User.where(role: 'Admin').count
      }
    ]
  end

 def self.xaxis
   ['cat a', 'cat b', 'cat c' 'cat d', 'cat e', 'cat f', 'cat g', 'cat h']
 end
end
