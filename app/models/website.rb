class Website < ApplicationRecord
  belongs_to :user
  has_many :alexaranks, dependent: :destroy
  validates :url, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :url, :scope => :user_id

  def fetch_alexa_rank_and_update!
    begin
      rank = Alexarank.fetch_rank domain: url.to_s
      self.alexaranks.create(rank: rank)
    rescue Exception => e
      Rails.logger.info "[AFE] #{url.to_s} rank fetch failed."
      Rails.logger.info "[AFE] #{e.message}"
    end
  end
end
