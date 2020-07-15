require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# to use patch and delete in controllers, need to add rack::methodoverride
use Rack::MethodOverride

use UsersController
use SessionsController
use DreamsController

run ApplicationController
