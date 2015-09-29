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

Sidenote
--------

As a noob in the *deb* packagin process, it was a bit painful to get the whole stuff
in place. After much reading and headaches, I finally made it. Here my conclusions:

- Ubuntu documentation on how to make things work (http://packaging.ubuntu.com/html/packaging-new-software.html)
is good, but it doesn't cover all aspects, as installation scripts or pre/post
scripts. It just give some general approaches or links as last resource, that turned
out to be critical in my experience.
Changing folders commands are not reliable as explained there. Some commands must be
run at different folder levels.
And finally, what did the trick was to add **install** file. Without it package
was created in an incomplete fashion.

- If you, as me, are not a bzr user, just add a .gitignore file to not track info
generated in *.bzr* folder. You'll still see *.git* folder inside PPA's code link,
but that's fine and desirable.

- There's no need to remove *.git* folder while packing, as the system gets rid
of removing it.

- I got some ideas from this other places too, just to build a more complete understading
of things:
		- http://askubuntu.com/questions/71199/manually-created-deb-how-do-i-upload-to-a-ppa
		- https://developer.ubuntu.com/en/publish/other-forms-of-submitting-apps/ppa/
		- http://askubuntu.com/questions/279686/how-to-package-a-simple-bash-script
		- http://askubuntu.com/questions/27715/create-a-deb-package-from-scripts-or-binaries/27731#27731
		- http://askubuntu.com/questions/71510/how-do-i-create-a-ppa
		- https://www.leaseweb.com/labs/2013/06/creating-custom-debian-packages/

Things still not clear are differences between **DEBIAN** and **debian** folders.
There is documentation either refering to one or the other. In the end, lowercase
version seemed to do the trick in Ubuntu PPA relationship.

