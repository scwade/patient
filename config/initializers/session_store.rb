# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_patient_session',
  :secret      => '749f17d8b221538a6d3e5629db1c176f6b70b74bc4a9b368f3a5de718ae2edc6e29afe811cfd55346f2931943f9f4f22321c0e8f7988535ee97de4143b40935a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
