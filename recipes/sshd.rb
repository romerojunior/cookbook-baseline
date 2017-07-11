sshd_template = template node['sshd_config'] do
  source 'sshd_config.erb'
end

service 'sshd' do
  action :reload
  only_if { sshd_template.updated_by_last_action? }
end
