## [jboss-forge-offline](https://aur.archlinux.org/packages/jboss-forge-offline/) is a package for [Arch Linux](https://www.archlinux.org/) .


It downloads [JBoss Forge](http://forge.jboss.org) distribution .

Install script copies distribution to /opt/jboss/forge and installs a symlink (forge) into /usr/bin/ .


I will release this package upon each upstream release.


#### Files

These files are the core of jboss-forge-offline package for Arch Linux.

- PKGBUILD
- jboss-forge-offline.install
- .SRCINFO

PKGBUILD
- Package build specification.
- Distribution is downloaded from GitHub .
- Files are copied into /opt/jboss/forge .
- Some hooks are specified in the following script .

jboss-forge-offline.install
- Install script is used when installing, upgrading or removing the package .

.SRCINFO
- Package metadata .


#### Dependencies

- java environment
