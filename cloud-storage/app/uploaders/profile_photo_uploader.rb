class ProfilePhotoUploader < CarrierWave::Uploader::Base
  if Rails.env.test?
    storage :file
  else
    storage :fog
  end
end

# This will use S3 when deployed to a production environment, as well as our
# development environment, and use the local filesystem when in the test
# environment.
