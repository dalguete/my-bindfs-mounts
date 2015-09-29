my-mounts-bindfs
================

Here resides a kind of framework that let us instantiate mounts in the way `bindfs`
command does, plus a persistence section, so a list of mounts can be stored in a
support file.

Next an explanation of each file here defined:

* `/usr/bin/my-bindfs-mounts`: Command aimed to feed persistence file with
mounts defined, along with options. By typing `my-bindfs-mounts` you'll get a list
will all possible options.

* `/etc/default/my-bindfs-mounts`: Persistence file with all mounts to handle. Each
line represents a bunch of args to pass to `bindfs` command, so you can manually
change things here; just, be careful to not insert invalid options.

* `/etc/init.d/my-bindfs-mounts`: Service file used to automatically do the mounts
on system startup, based on whatever has been set in the persistence file.

**IMPORTANT:** this process does **NOT** create *ORIGIN* and *DESTINATION* paths.
You will have to ensure both of them exists previously.

Ubuntu PPA
==========

You can find the package as a PPA here https://launchpad.net/~dalguete/+archive/ubuntu/my-bindfs-mounts

Sidenote: About My Experience Creating Deb Packages Plus Ubuntu's PPA
---------------------------------------------------------------------

http://dalguete.github.io/#about-my-experiences-creating-deb-packages-plus-ubuntus-ppa

