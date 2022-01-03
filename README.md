dis4irc-aur
===========
This is an *unoffical* AUR package for [Dis4IRC](https://github.com/zachbr/Dis4IRC)

It creates an isolated user and includes a systemd unit file. It downloads the binary instead of compiling it (see below).

It is in no way endorsed by upstream, so make sure you can distinguish between their bugs and ours ;)

Also, this is my first time mirroring an AUR package to github.

PRs and issues are welcome.

## Why precompiled binaries
 This package uses precompiled jar files, but does *not* have the traditional `-bin` suffix in its name.

This is because the Java packaging guidelines say "You do not need to compile Java applications from source" ([See wiki](https://wiki.archlinux.org/title/Java_package_guidelines#Java_packaging_on_Arch_Linux)).

This is common practice even in the official Java packages. For example `jenkins` just downloads the offical jar and checks the hash.

Compiling from source would require installing gradle (or using the wrapper) and take much longer.


