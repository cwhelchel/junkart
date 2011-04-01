# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_junkart_session',
  :secret      => 'a53f63f9b2b7fdccd1e3348a293503b6678777b221e8855dba6b5c5ff85a6f9eeed6363e5d41ef54b0dafbff0818d2fa5bfd05b3b4df9aba07065f7edbbddf86'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
