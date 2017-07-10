#
# Cookbook Name:: apache2
# Recipe:: install
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

node['apps'].each do |app|
  package app do
    action :install
  end
end
