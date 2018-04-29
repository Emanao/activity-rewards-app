Rails.application.config.middleware.use OmniAuth::Builder do
    #provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
    provider :github, 'facce1fd25de823dc80f', '61210dc52b59e371cac0f332a3c832427f651ef7'
  end