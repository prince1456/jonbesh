class User < ApplicationRecord

 has_secure_password


 validates :first_name, presence: true
 validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
                    uniqueness: {case_sensitive: false},
                    format:     VALID_EMAIL_REGEX,
                    unless:     :from_oauth?


  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end

  def from_oauth?
    uid.present? && provider.present?
  end

  def self.find_or_create_from_twitter(twitter_data)
    find_by_twitter(twitter_data) || create_from_twitter(twitter_data)
  end

  def self.find_by_twitter(twitter_data)
    find_by(uid: twitter_data["uid"], provider: twitter_data["provider"])
  end

  def self.create_from_twitter(twitter_data)
    full_name = twitter_data["info"]["name"].split
    create!(first_name:       full_name[0],
           last_name:        full_name[1],
           uid:              twitter_data["uid"],
           provider:         twitter_data["provider"],
           twitter_token:    twitter_data["credentials"]["token"],
           twitter_secret:   twitter_data["credentials"]["secret"],
           password:         SecureRandom.hex(32),
           twitter_raw_data: twitter_data,
           awatar:            twitter_data["info"]["image"])

  end

  def from_twitter?
    uid.present? && provider == "twitter"
  end


    def self.find_or_create_from_facebook(facebook_data)
      find_by_facebook(facebook_data) || create_from_facebook(facebook_data)
    end

    def self.find_by_facebook(facebook_data)
      find_by(uid: facebook_data["uid"], provider: facebook_data["provider"])
    end

    def self.create_from_facebook(facebook_data)
      full_name = facebook_data["info"]["name"].split
      create!(first_name:           full_name[0],
             last_name:             full_name[1],
             uid:                  facebook_data["uid"],
             provider:             facebook_data["provider"],
             facebook_token:       facebook_data["credentials"]["token"],
             facebook_expire_at:   facebook_data["credentials"]["expire_at"],
             password:             SecureRandom.hex(32),
             awatar:               facebook_data["info"]["image"])

    end

    def from_facebook?
      uid.present? && provider == "facebook"
    end

    def facebook
      @facebook ||= Koala::Facebook::API.new(facebook_token)
    end

end
