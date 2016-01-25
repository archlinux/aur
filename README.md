This is a package for building ArangoDB on Arch Linux.

It uses all available processor cores for compiling resulting faster
build times, and drops unnecessary dependencies like ICU.

Things to explore in the future:
* Incorporate relevant systemd security options
* Include a selinux/apparmour profile by default
* Signing the package
* Encouraging Arango to sign their releases
* Put the package in my own custom repo
