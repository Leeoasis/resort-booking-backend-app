Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3001'
      resource '*',
      headers: ["Authorization"],
      expose: ["Authorization"],
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      max_age: 600
    end

    allow do
      origins 'https://resort-app-frontend.onrender.com'
      resource '*',
      headers: ["Authorization"],
      expose: ["Authorization"],
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      max_age: 600
    end
  end