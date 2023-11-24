# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.development?
      origins 'localhost:3000', 'localhost:3001', 'rz5tz7xd-5000.asse.devtunnels.ms'
    else
      origins 'rz5tz7xd-5000.asse.devtunnels.ms'
    end

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end