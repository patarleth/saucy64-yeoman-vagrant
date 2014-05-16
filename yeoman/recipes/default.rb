include_recipe "yeoman::build_install_node"

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
