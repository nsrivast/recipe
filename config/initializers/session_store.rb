# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_recipe_session',
  :secret      => 'a4357cce28eb334bf325b54557ccc72194c8b4c50caa668182d8215f31db8538ad6ec9cb4e61da7f552d2b49940f21bad9e8c7f17b245db1c585c0f0efff8e7b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
