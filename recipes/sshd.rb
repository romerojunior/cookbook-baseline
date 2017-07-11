if %w(centos redhat).include?(node['platform'])
  service_name = 'sshd'
elsif %w(debian ubuntu).include?(node['platform'])
  service_name = 'ssh'
end

template node['sshd_config'] do
  source 'sshd_config.erb'
  notifies :reload, "service[#{service_name}]"
end

service service_name do
  action [:enable, :start]
end
