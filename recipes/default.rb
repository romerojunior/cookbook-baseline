#
# Cookbook Name:: baseline
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'baseline::configure' if node['platform'] == 'centos'
include_recipe 'baseline::install'
