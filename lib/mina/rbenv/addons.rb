require 'mina/rbenv'

# ### rbenv_ruby_version
# Is used by *ruby-build* to install a new ruby version.
#
# Change it if you want to upgrade or install a new ruby version.

set :rbenv_ruby_version, "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}".chomp('-p0')

# ### rbenv_git_url
# Sets the rbenv git url to clone
#
# Change it if you want to use a fork

set :rbenv_git_url, 'git://github.com/sstephenson/rbenv.git'

# ### ruby_build_git_url
# Sets the ruby-build git url to clone
#
# Change it if you want to use a fork

set :ruby_build_git_url, 'git://github.com/sstephenson/ruby-build.git'


# ## Tasks


# ### rbenv:setup
# Installs the *rbenv* and *ruby-build* runtime.

task :'rbenv:setup' do
  ruby_build_path = "#{fetch(:rbenv_path)}/plugins/ruby-build"
  command %{
    echo "-----> Installing rbenv..."
    #{echo_cmd %{git clone #{fetch(:rbenv_git_url)} #{fetch(:rbenv_path)}} }
    #{echo_cmd %{git clone #{fetch(:ruby_build_git_url)} #{ruby_build_path}} }
  }
end

# ### rbenv:upgrade
# Upgrades the *rbenv* and *ruby-build* runtime.

task :'rbenv:upgrade' do
  ruby_build_path = "#{fetch(:rbenv_path)}/plugins/ruby-build"
  command %{
    echo "-----> Upgrading rbenv and ruby-build..."
    #{echo_cmd %{pushd #{fetch(:rbenv_path)}; git pull; popd} }
    #{echo_cmd %{pushd #{ruby_build_path}; git pull; popd} }
  }
end

# ### rbenv:install
# Installs the ruby version.

task :"rbenv:install:#{fetch(:rbenv_ruby_version)}" => :'rbenv:load' do
  command %{
    echo "-----> Installing ruby-#{fetch(:rbenv_ruby_version)}..."
    #{echo_cmd %{rbenv install #{fetch(:rbenv_ruby_version)}} }
    #{echo_cmd %{rbenv local #{fetch(:rbenv_ruby_version)}} }
    #{echo_cmd %{rbenv rehash} }
    #{echo_cmd %{gem install bundler} }
    #{echo_cmd %{rbenv rehash} }
  }
end
