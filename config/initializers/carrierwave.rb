# frozen_string_literal: true

# require "carrierwave/storage/abstract"
# require "carrierwave/storage/file"
# require "carrierwave/storage/fog"

# Excon.defaults[:ssl_verify_peer] = false if Rails.env.development?

# ENV_DIRECTORY_MAP = { "production" => "newproduction" }.freeze
# FOG_DIRECTORY = "bp-v-#{ENV_DIRECTORY_MAP.fetch(Rails.env, Rails.env)}"


CarrierWave.configure do |config|
  config.storage = :fog

  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     Rails.application.credentials.config[:aws][:access_key_id],
    aws_secret_access_key: Rails.application.credentials.config[:aws][:secret_access_key],
    region:                'eu-west-2',
    # host: "s3-eu-west-2.amazonaws.com",
  }

  config.fog_directory = 'benstacey'
end

# if Rails.env.test?
#   CarrierWave.configure do |config|
#     config.storage = :file
#     config.enable_processing = false
#   end
# end

  # config.fog_attributes = {
  #   "Cache-Control" => "max-age=2628000,public",
  #   "Expires" => 3.months.from_now.httpdate
  # }

  # config.fog_directory = FOG_DIRECTORY
  # config.max_file_size = 15.megabytes

  # if Rails.env.development?
  #   config.asset_host = ENV["DEFAULT_ASSET_HOST"] || "https://dev-assets1.biggerpockets.com"
  # elsif Rails.env.review?
  #   config.fog_directory = "bp-review-apps/#{Rails.configuration.x.heroku_app_name}"
  # elsif Rails.env.staging?
  #   config.fog_directory = ENV["HEROKU_APP_NAME"] || "bp-v-staging" # Bucket
  # elsif Rails.env.production?
  #   config.asset_host = ENV["DEFAULT_ASSET_HOST"] || "https://assets1.biggerpockets.com"
  # end