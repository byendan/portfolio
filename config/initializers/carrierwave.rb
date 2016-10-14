CarrierWave.configure do |config|



  config.fog_credentials = {
    :provider               => 'Rackspace',
    :rackspace_username     => ENV['RACKSPACE_USERNAME'],
    :rackspace_api_key      => ENV['RACKSPACE_API_KEY'],
    :rackspace_region       => ENV['RACKSPACE_REGION']
  }
  config.fog_directory = 'portfolio'


end
