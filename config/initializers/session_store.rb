# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_proficientMD_session',
  :secret      => 'e42a8431e29ca1ff6981e6c4544854a2eb07864d517a851cf139085484c31b3dbcbd1671e4f075447ae60d911538e75b412dbcc5ebd0dc36e62743e729bb9c28'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
