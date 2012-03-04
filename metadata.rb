maintainer       "Lisa Hagemann"
maintainer_email "chakram88@gmail.com"
license          "Apache 2.0"
description      "Installs cpanminus, includes recipe to install CPAN modules with cpanminus"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
recipe           "default", "install_mods"

%w{debian osx}.each do |os|
  supports os
end


attribute "cpanminus/mod_list"
  :display_name => "Mod List"
  :description  => "List of CPAN modules to install"
  :type         => "array"

