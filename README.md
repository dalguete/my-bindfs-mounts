my-mounts-bindfs
================

Here resides a kind of framework (someday it will be a deb package), that let us 
instantiate mounts in the way `bindfs` command does, plus a persistence section, 
so a list of mounts can be stored in a support file.

There are some files, defined next to this one, each one doing a specific task.

* `/usr/local/bin/my-bindfs-mounts`: Command aimed to feed persistence file with
mounts defined, along with options. By typing `my-bindfs-mounts` you'll get a list
will all possible options.

To use it, copy the file into the defined place, and do:
```
chown root.root /usr/local/bin/my-bindfs-mounts
chmod 755 /usr/local/bin/my-bindfs-mounts
```

* `/etc/default/my-bindfs-mounts`: Persistence file with all mounts to handle. Each
line represents a bunch of args to pass to `bindfs` command, so you can manually
change things here; just, be careful to not insert invalid options.

To use it, copy the file into the defined place, and do:
```
chown root.root /etc/default/my-bindfs-mounts
chmod 644 /etc/default/my-bindfs-mounts
```

* `/etc/init.d/my-bindfs-mounts`: Service file used to automatically do the mounts,
based on whatever has been set in the persistence file.

To use it, copy the file into the defined place, and do:
```
chown root.root /etc/init.d/my-bindfs-mounts
chmod 755 /etc/init.d/my-bindfs-mounts
update-rc.d my-bindfs-mounts defaults
```

The last command creates a service that will bring all bindfs mounts back to life
every time machine starts.

**IMPORTANT:** this process does **NOT** create *ORIGIN* and *DESTINATION* paths.
You will have to ensure both of them exists previously.
