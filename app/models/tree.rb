class Tree < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user

  attr_accessor :show_instagram, :show_youtube, :show_x, :show_github

  validates :name, presence: true, length: { minimum: 5, message: "must be at least 5 characters long" }

  # Conditional social link validations
  validates :instagram, presence: true,
                        format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "Invalid URL format" },
                        if: :instagram_enabled?

  validates :youtube, presence: true,
                      format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "Invalid URL format" },
                      if: :youtube_enabled?

  validates :x, presence: true,
                format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "Invalid URL format" },
                if: :x_enabled?

  validates :github, presence: true,
                     format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "Invalid URL format" },
                     if: :github_enabled?

  def instagram_enabled?
    ActiveModel::Type::Boolean.new.cast(show_instagram)
  end

  def youtube_enabled?
    ActiveModel::Type::Boolean.new.cast(show_youtube)
  end

  def x_enabled?
    ActiveModel::Type::Boolean.new.cast(show_x)
  end

  def github_enabled?
    ActiveModel::Type::Boolean.new.cast(show_github)
  end
end
