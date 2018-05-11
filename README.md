# my-bindfs-mounts

bindfs mounts helper, with persistence layer

## Description

Here resides a kind of framework that lets us instantiate mounts in the way `bindfs` command does, plus a persistence section, so a list of mounts can be stored in a support file.

## Folder Structure

It's really simple, aimed to enable program distribution under different formats. 

- ***src***: contains all the real code on the solution.
- ***snap***: configurations to create a snap package on the project.
- ***Makefile***: configurations to install the package but using the ubiquitous make tool.

## Source Code Explanation

Next an explanation of each file here defined:

* `src/usr/bin/my-bindfs-mounts`: Command aimed to feed persistence file with mounts defined, along with options. By typing `my-bindfs-mounts` you'll get a list will all possible options.

* `src/etc/default/my-bindfs-mounts`: Persistence file with all mounts to handle. Each line represents a bunch of args to pass to `bindfs` command, so you can manually change things here; just, be careful to not insert invalid options.

**IMPORTANT:** this process does **NOT** create *ORIGIN* and *DESTINATION* paths. You will have to ensure both of them exists previously.

# Makefile

Clone the project and, inside of it, run:

```
sudo make install
```

Done! For upgrades, simply clone the project again and run the previous command again.

To remove simply run `sudo make uninstall`.

# Snap Package

Check **snap** folder with all configuration information ready to build a snap package. More info about snaps here https://docs.snapcraft.io/snaps/intro.

Commands to trigger package creation can be run from this project's root level.

## TODO:
- Check how to create a cleaner snap package. So far, when run `snapcraft cleanbuild` command, everything goes great, but there's a .bz2 file inside the created snap that has everything this repo has, even **.git** folder, and that's how that's published. No Bueno!

# Ubuntu PPA (legacy)

***THIS HAS BEEN DEPRECATED, NO LONGER CREATING .deb PACKAGES.***
***<br/>Left this here for future reference.***

> You can find the package as a PPA here https://launchpad.net/~dalguete/+archive/ubuntu/my-bindfs-mounts
> 
> ## Sidenote: *About My Experience Creating .deb Packages Plus Ubuntu's PPA*
> 
> http://dalguete.github.io/#about-my-experiences-creating-deb-packages-plus-ubuntus-ppa
