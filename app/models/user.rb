class User < ApplicationRecord
  has_one_attached :avatar

  validates :gender, :title, :first_name, :last_name, :email, :avatar, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  enum gender: [:male, :female, :other]
  enum title: [:Mr, :Mrs, :Ms, :Miss, :Monsieur]

  def full_name
    "#{title} #{first_name} #{last_name}".titleize
  end
end
