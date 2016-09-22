Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_API_SECRET']
  provider :facebook, ENV['FACEBOOK_AP_ID'], ENV['FACEBOOK_AP_SECRET'], scope: [:public_profile,
                                                                                :publish_actions,
                                                                                :user_friends,
                                                                                :read_custom_friendlists,
                                                                                :user_photos,
                                                                                :user_posts
                                                                      ]
end
