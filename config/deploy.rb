set :application, "barcamplive"
set :keep_releases, 3

set :scm, :git
set :repository,  "git://github.com/tylerhunt/barcamplive.git"

set :user, "deploy"
set :runner, "deploy"
set :deploy_to, "/var/www/vhosts/#{application}"

role :app, "alpha.devoh.com"
role :web, "alpha.devoh.com"
role :db,  "alpha.devoh.com", :primary => true

namespace :deploy do
  task :after_update_code do
    run "ln -nfs #{shared_path}/config/thin.yml #{release_path}/config/"
  end

  task :start, :roles => :app do
    run "#{try_runner} thin start -C #{current_path}/config/thin.yml"
  end

  task :stop, :roles => :app do
    run "#{try_runner} thin stop -C #{current_path}/config/thin.yml"
  end

  task :restart, :roles => :app do
    run "#{try_runner} thin restart -C #{current_path}/config/thin.yml"
  end
end
