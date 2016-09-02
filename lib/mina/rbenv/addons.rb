require 'mina/rbenv'

# ### rbenv_ruby_version
# Is used by *ruby-build* to install a new ruby version.
#
# Change it if you want to upgrade or install a new ruby version.

set_default :rbenv_ruby_version, "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}".chomp('-p0')

# ### rbenv_git_url
# Sets the rbenv git url to clone
#
# Change it if you want to use a fork

set_default :rbenv_git_url, 'git://github.com/sstephenson/rbenv.git'

# ### ruby_build_git_url
# Sets the ruby-build git url to clone
#
# Change it if you want to use a fork

set_default :ruby_build_git_url, 'git://github.com/sstephenson/ruby-build.git'


# ## Tasks


# ### rbenv:setup
# Installs the *rbenv* and *ruby-build* runtime.

task :'rbenv:setup' do
  ruby_build_path = "#{rbenv_path}/plugins/ruby-build"
  queue %{
    echo "-----> Installing rbenv..."
    #{echo_cmd %{git clone #{rbenv_git_url} #{rbenv_path}} }
    #{echo_cmd %{git clone #{ruby_build_git_url} #{ruby_build_path}} }
  }
end

# ### rbenv:upgrade
# Upgrades the *rbenv* and *ruby-build* runtime.

task :'rbenv:upgrade' do
  ruby_build_path = "#{rbenv_path}/plugins/ruby-build"
  queue %{
    echo "-----> Upgrading rbenv and ruby-build..."
    #{echo_cmd %{pushd #{rbenv_path}; git pull; popd} }
    #{echo_cmd %{pushd #{ruby_build_path}; git pull; popd} }
  }
end

# ### rbenv:install
# Installs the ruby version.

task :"rbenv:install:#{rbenv_ruby_version}" => :'rbenv:load' do
  queue %{
    echo "-----> Installing ruby-#{rbenv_ruby_version}..."
    #{echo_cmd %{rbenv install #{rbenv_ruby_version}} }
    #{echo_cmd %{rbenv local #{rbenv_ruby_version}} }
    #{echo_cmd %{rbenv rehash} }
    #{echo_cmd %{gem install bundler} }
    #{echo_cmd %{rbenv rehash} }
  }
end
