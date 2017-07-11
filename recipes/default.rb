#
# Cookbook Name:: baseline
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'baseline::epel' if node['platform'] == 'centos'
include_recipe 'baseline::install'
include_recipe 'baseline::sshd'
include_recipe 'baseline::motd'
