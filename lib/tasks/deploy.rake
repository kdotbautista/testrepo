namespace :deploy do

  desc "Deploy to environment"
  task :to do
    env = ENV['e'] || 'production'
    sh "ey deploy --no-migrate -e #{env}"
  end

end

