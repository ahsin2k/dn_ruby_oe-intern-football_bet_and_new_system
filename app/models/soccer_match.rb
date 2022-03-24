class SoccerMatch < ApplicationRecord
  belongs_to :tournament
  belongs_to :home_team, class_name: Team.name, foreign_key: :home_id
  belongs_to :guest_team, class_name: Team.name, foreign_key: :guest_id

  has_many :bets, dependent: :destroy
  has_many :goal_results, dependent: :destroy

  delegate :name, to: :home_team, prefix: :home, allow_nil: true
  delegate :name, to: :guest_team, prefix: :guest, allow_nil: true

  scope :newest, ->{order(time: :asc)}

  delegate :name, to: :home_team, prefix: :home
  delegate :name, to: :guest_team, prefix: :guest
  delegate :name, to: :tournament, prefix: :tournament
end
