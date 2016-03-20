CarrierWave.configure do |config|


  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines
  config.fog_credentials = {
    :provider               => 'Rackspace',
    :rackspace_username     => ENV['RACKSPACE_USERNAME'],
    :rackspace_api_key      => ENV['RACKSPACE_API_KEY'],
    :rackspace_servicenet   => Rails.env.production?,
    :rackspace_region       => ENV['RACKSPACE_REGION'],
    :persistent => false
  }
  config.fog_directory = 'portfolio'
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false

end
