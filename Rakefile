ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "print out hello world"
task :hello do
    puts "Hello World!"
end

# drop databases
# can do this to re-edit a table or something 
# then run rake db:migrate again
# will create a completely new database
desc "Drops both development and testing databases"
task :drop_all do
    puts "droping the databases..."
    system "rm db/development.sqlite && rm db/test.sqlite && rm db/schema.rb"
end

desc "Migrates both developement and testing dabases."
task :migrations do
    puts "migrating databases..."
    system "rake db:migrate && rake db:migrate SINATRA_ENV=test"
    puts "seeding database"
    system "rake db:seed"
    puts "done"
end

desc "Reset All"
task :reset_all do
    Rake::Task["drop_all"].execute
    Rake::Task["migrations"].execute
    system "shotgun"
end