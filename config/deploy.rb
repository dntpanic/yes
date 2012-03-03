# DO NOT DELETE THIS
#ssh_options[:verbose] = :debug 
#ssh_options[:config]=true
set :bundle_flags, "--deployment --quiet --binstubs ruby-local-exec"
set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

require "bundler/capistrano"
set :application, "yes.dontpanic.com.ua"
set :repository,  "git@github.com:dntpanic/yes.git"

set :scm, "git"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "www-data"
set :branch, "master"
set :scm_verbose, true
set :deploy_via, :remote_cache
set :use_sudo, false

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/www/#{application}"

namespace :deploy do
  task :restart, :roles => :web, :except => { :no_release => true } do
    run "/etc/init.d/unicorn_init upgrade"
  end
end

set :domain, "dontpanic.com.ua"
set :rails_env, "master"

role :app, domain
role :web, domain
role :db,  domain, :primary => true
role :worker, domain

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
after 'deploy:update_code', 'deploy:symlink_db'

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
end