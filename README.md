# Package build description for OpenJDK 8 with Shenandoah GC [![travis-badge][]][travis]

[travis]:          https://travis-ci.org/2m/java-openjdk-shenandoah-pkgbuild
[travis-badge]:    https://travis-ci.org/2m/java-openjdk-shenandoah-pkgbuild.svg?branch=master

This repository holds instructions for building an Arch Linux package for [OpenJDK 8 with Shenandoah GC](https://wiki.openjdk.java.net/display/shenandoah/Main).

The PKGBUILD originally taken from [intellij-jdk](https://aur.archlinux.org/packages/intellij-jdk/) package.

## Pushing to AUR

First generate `.SRCINFO` by:

```
makepkg --printsrcinfo > .SRCINFO
```

Then push to AUR git repository by:

```
git remote add aur ssh://aur@aur.archlinux.org/java-8-openjdk-shenandoah.git
git push aur
```
