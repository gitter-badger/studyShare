# Load the Rails application.
require_relative 'application'

# Setting ENV var
ENV["DATABASE_URL"] = "db"

# Initialize the Rails application.
Rails.application.initialize!
