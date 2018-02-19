CarrierWave.configure do |config|
  if !Rails.env.test?
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    }
    config.fog_directory  = ENV["S3_BUCKET"]
  end
end

# Now when we start our Rails application, it will read our security credentials
# from environment variables so that we can connect to our S3 bucket.
#
# Note that we conditionally configure fog based on our current environment,
# just the same way we swap out our storage method in the ProfilePhotoUploader
# based on environment.
