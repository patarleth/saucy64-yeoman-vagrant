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
    if [ -x $(command -v node) ] && [ "$(node -v)" != "v0.11.12" ]
    then
      ./configure
      make
      make install
    fi
  EOF
end
