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


