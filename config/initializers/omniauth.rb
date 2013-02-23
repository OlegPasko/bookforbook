Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "973456311933.apps.googleusercontent.com", "57FUrTPipj-GbLuB5qbsVCaY"
end