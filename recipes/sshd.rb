template node['sshd_config'] do
  source 'sshd_config.erb'
  notifies :reload, 'service[sshd]'
end

service 'sshd' do
  action [:enable, :start]
end
