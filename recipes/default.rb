#
# Cookbook Name:: cpanminus
# Recipe:: default
#
# Copyright 2012, Lisa Hagemann
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


# Install cpan minus from source
chef_cache = Chef::Config[:file_cache_path]
remote_file "cpanm-source" do
	action :nothing
	path "#{chef_cache}/cpanm-source"
	source node['cpanminus']['source']
end

execute "cpanminus install" do
	action :nothing
	## there are odd cases when cpanm deleted but package info still there...
	## to prevent those we'll force reinstall if cpanm not found
	cmd = "perl #{chef_cache}/cpanm-source --reinstall App::cpanminus"
	if node['cpanminus']['test_self'] == false
		cmd += " --notest"
	end
	if node['cpanminus']['man_pages'] == false
		cmd += " --no-man-pages"
	end
	command cmd
end

## I wonder if there is better cheat to check condition once for two resources than ruby_block
ruby_block "check if installed" do
	if node['cpanminus']['path'] != ''
		not_if "ls #{node['cpanminus']['path']}/cpanm >/dev/null 2>&1"
	else
		not_if "which cpanm >/dev/null 2>&1"
	end
	notifies :create, "remote_file[cpanm-source]", :immediately
	notifies :run, "execute[cpanminus install]", :immediately
	block do
		Chef::Log.info "Downloading and installing cpanminus"
	end
end
