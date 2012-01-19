#
# Cookbook Name:: cpanminus
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# Install cpan minus from source
execute "get_cpanmin" do
	command "curl -L http://cpanmin.us | perl - --sudo App::cpanminus" 
end