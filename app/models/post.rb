class Post < ActiveRecord::Base
  #thumbs_up gem
  acts_as_voteable

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: {maximum: 32}
  validates :whitetext, presence: true, length: {maximum: 140}
  validates :blacktext, presence: true, length: {maximum: 140}

  scope :one_day_ago, lambda { where("created_at >= :date", :date => 1.days.ago) }
  scope :one_week_ago, lambda { where("created_at >= :date", :date => 1.weeks.ago) }
  scope :one_month_ago, lambda { where("created_at >= :date", :date => 1.months.ago) }

end
