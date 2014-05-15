git '/usr/src/node' do
  repository 'https://github.com/joyent/node.git'
  revision 'v0.11.12-release'
  action :sync
  user 'root'
  group 'root'
end

bash 'build-and-install node' do
  cwd '/usr/src/node'
  user 'root'
  group 'root' 
  code <<-EOF
     ./configure
     make
     make install
  EOF
end

execute 'yeoman' do
  command 'npm install -g yo'
  user 'root'
  group 'root'
end

node['yeoman']['generators'].each do |gen_name|
  execute "yo generator-#{gen_name}" do
    command "npm install -g generator-#{gen_name}"
    user 'root'
    group 'root'
  end
end

execute 'grunt-contrib-compass' do
  command 'npm install -g grunt-contrib-compass --save-dev'
  user 'root'
  group 'root'
end

gem_package 'compass' do
  action :install
end
