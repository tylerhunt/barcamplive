# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tmp_session',
  :secret      => '65c5e35adefa7ab5751ae43be6dea495f7e993ef42d6356f3816520f6266f7c011e6a9a96602dbb349a0e6b67fefbc902f01fd1385b02b746057da39e3a33f3a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
