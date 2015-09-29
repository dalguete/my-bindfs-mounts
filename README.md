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

I'm setting some info on how to create **deb** packages here, just to not forget
about it the next time.
Sadly I had to deal with a lot of suffering understanding the whole process as I
was a complete noob on the field.

So here resides some good resources on what to do next time I need to build a deb
package again.

- As I wanted to publish this under PPA, it's important to set all gpg keys stuff
in place in first place. For that, follow this steps http://packaging.ubuntu.com/html/getting-set-up.html
There a lot of things I didn't use in the end, as bzr or pbuilder, but it's THE
starting point.
- Following the general Ubuntu guide is good (http://packaging.ubuntu.com/html/packaging-new-software.html),
but it'd be better is a more general example would be used. In my case, I had to
deal with deb packages for scripts only, and that required a lot of reading in other
places. Also I didn't use the bzr stuff, maybe a mistake, but I found it not useful
for my intentions.
- To install my scripts, I had to deal with the use of files not mentioned in Ubuntu
guide, like *copyright*, *install*, *postinst* and *prerm*. The last three ones particularly
important as there resides logic for installation files location and processes for
installing and uninstalling software.
- I realized there's no need to remove *.git* folder while packing as the system
gets rid of removing it.
- I got some ideas from this other place too, just to build a more complete understading
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

