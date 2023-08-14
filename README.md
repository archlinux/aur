[dt](https://github.com/so-dang-cool/dt) as packaged for AUR.

# Maintaining

Packaging references:

- https://wiki.archlinux.org/title/AUR_submission_guidelines
- https://wiki.archlinux.org/title/Arch_package_guidelines
- https://man.archlinux.org/man/PKGBUILD.5
- https://man.archlinux.org/man/makepkg.8

tl;dr: these are probably the steps for a simple version bump

1. Update the version/sha256sum in PKGBUILD
2. Run `./build.sh clean install check`
3. Commit and push

