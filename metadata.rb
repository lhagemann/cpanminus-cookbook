maintainer       "Lisa Hagemann"
maintainer_email "chakram88@gmail.com"
license          "Apache 2.0"
description      "Installs cpanminus, includes recipe to install CPAN modules with cpanminus"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"
recipe           "default", "install_mods"

%w{fedora amazon debian ubuntu osx freebsd}.each do |os|
  supports os
end

attribute "cpanminus",
  :display_name => "Cpanminus",
  :description  => "Hash of cpanminus attributes",
  :type         => "hash"


attribute "cpanminus/path",
  :display_name => "Path",
  :description  => "When your system installs perl binary to odd directory you might need this one",
  :type         => "string",
  :default      => ""


attribute "cpanminus/mod_list",
  :display_name => "Mod List",
  :description  => "List of CPAN modules to install",
  :type         => "array",
  :default      => ""

attribute "cpanminus/test_self",
  :display_name => "Test Self",
  :description  => "Asking cpanm to test all modules when installing/upgrading self",
  :type         => "string",
  :default      => "false"

attribute "cpanminus/test_others",
  :display_name => "Test Self",
  :description  => "Asking cpanm to run tests (except when installing/upgrading self)",
  :type         => "string",
  :default      => "true"

attribute "cpanminus/man_pages",
  :display_name => "Man Pages",
  :description  => "Controls if module man_pages should be prohibited if set to false (true will mean 'use system defaults')",
  :type         => "string",
  :default      => "true"

attribute "cpanminus/source",
  :display_name => "Source",
  :description  => "Defines remote_file where cpanm source should be loaded from",
  :type         => "string",
  :default      => "http://cpanmin.us/"

# https://raw.github.com/miyagawa/cpanminus/master/cpanm is good alternative
