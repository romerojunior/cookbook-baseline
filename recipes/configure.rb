require 'chef/version_constraint'

epel_filename = "#{Chef::Config[:file_cache_path]}/#{node['temp_epel']}"

if Chef::VersionConstraint.new('~> 6.0').include?(node['platform_version'])
  remote_file epel_filename do
    source 'http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'
    action :create_if_missing
  end
end

if Chef::VersionConstraint.new('~> 7.0').include?(node['platform_version'])
  remote_file epel_filename do
    source 'http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm'
    action :create_if_missing
  end
end

rpm_package 'epel' do
  source "#{Chef::Config[:file_cache_path]}/epel.rpm"
  action :install
end
