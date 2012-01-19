#
# Cookbook Name:: cpanminus
# Recipe:: cpanminus::install_mods
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "cpanminus"

mod_list = node['cpanminus']['mod_list']

mod_list.each do |mod|
	execute "install_#{mod}" do 
	  command "sudo cpanm #{mod}"
	end
end
