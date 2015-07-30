# 
# As a web developer with computer ethics
# Please, please pretend that you've seen nothing here
# If I got another way to solve my upload issue, I wouldn't disclose my credentials here!

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for S3
      :provider              => 'AWS',
      :aws_access_key_id     => 'AKIAJEAVHQOJDQ7XALQQ' , #ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => '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' #ENV['S3_SECRET_KEY']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
  end
end