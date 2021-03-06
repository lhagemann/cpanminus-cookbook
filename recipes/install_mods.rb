#
# Cookbook Name:: cpanminus
# Recipe:: cpanminus::install_mods
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

include_recipe "cpanminus"

mod_list = node['cpanminus']['mod_list']

mod_list.each do |mod|
	execute "install_#{mod}" do 
		# I'm not sure why SUDO was here before.... if it's necessary --sudo is better
		# and probably via node['cpanminus']['sudo']
		cmd = "cpanm #mod"
		if node['cpanminus']['test_others'] == false
			cmd += " --notest"
		end
		if node['cpanminus']['man_pages'] == false
			cmd += " --no-man-pages"
		end
		command cmd
	end
end
