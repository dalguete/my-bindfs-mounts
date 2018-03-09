# bindfs-mounts

bindfs mounts helper, with persistence layer

### Description

Here resides a kind of framework that let us instantiate mounts in the way `bindfs`
command does, plus a persistence section, so a list of mounts can be stored in a
support file.

Next an explanation of each file here defined:

* `/usr/bin/bindfs-mounts`: Command aimed to feed persistence file with
mounts defined, along with options. By typing `bindfs-mounts` you'll get a list
will all possible options.

* `/etc/default/bindfs-mounts`: Persistence file with all mounts to handle. Each
line represents a bunch of args to pass to `bindfs` command, so you can manually
change things here; just, be careful to not insert invalid options.

**IMPORTANT:** this process does **NOT** create *ORIGIN* and *DESTINATION* paths.
You will have to ensure both of them exists previously.

Snap Package
============

The project distribution is aimed to be build as a ***snap*** package (more info here https://docs.snapcraft.io/snaps/intro).
Original intention was to distribute it as a .deb package, but Canonical's new format
proved to be more easy, flexible and robust (so far!).

Ubuntu PPA (legacy)
===================

This was the original description on where and how .deb package for this project was created.
Methos No longer Used, but leaving this note here just historic reasons.

> You can find the package as a PPA here https://launchpad.net/~dalguete/+archive/ubuntu/my-bindfs-mounts
> 
> Sidenote: About My Experience Creating Deb Packages Plus Ubuntu's PPA
> ---------------------------------------------------------------------
> 
> http://dalguete.github.io/#about-my-experiences-creating-deb-packages-plus-ubuntus-ppa