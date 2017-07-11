require 'chef/version_constraint'

epel_filename = "#{Chef::Config[:file_cache_path]}/#{node['temp_epel']}"

remote_file epel_filename do
  if Chef::VersionConstraint.new('~> 6.0').include?(node['platform_version'])
    source 'http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'
  elsif Chef::VersionConstraint.new('~> 7.0').include?(node['platform_version'])
    source 'http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm'
  end
  action :create_if_missing
end

rpm_package node['temp_epel'].split('.').first do
  source epel_filename
  action :install
end
