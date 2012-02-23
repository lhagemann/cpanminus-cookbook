DESCRIPTION:
============

a cookbook for installing cpanminus

includes recipe for using cpanminus to add CPAN modules

REQUIREMENTS:
=============

* curl

Should run on any platform, tested on MacOSX and Debian

ATTRIBUTES:
===========

* `node['cpanminus']['mod_list]` = list of CPAN modules to install

RECIPES
=======

default
-------

The default recipe uses curl to install App::cpanminus from source

install_mods
------------

Reads the list of mods from `node['cpanminus']['mod_list']` and installs them
using cpanminus


License and Author
==================

Copyright 2012, Lisa Hagemann

Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.

