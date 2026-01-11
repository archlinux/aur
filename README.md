# js8call-improved AUR Package

This is an AUR package for [JS8Call Improved](https://github.com/JS8Call-improved/JS8Call-improved/).

## Building the Package

To build the package from source:

```bash
makepkg
```

## Testing Installation

To build and install the package locally for testing:

```bash
makepkg --syncdeps --install
```

Or use the shorthand:

```bash
makepkg -si
```

## Updating package sums

Just run `updpkgsums`

## Updating .SRCINFO

After making changes to the PKGBUILD, update the `.SRCINFO` file before committing:

```bash
makepkg --printsrcinfo > .SRCINFO
```

## Related Links

### Project
- [JS8Call Improved (Upstream)](https://github.com/JS8Call-improved/JS8Call-improved/)
- [js8call (Original AUR Package)](https://aur.archlinux.org/packages/js8call)

### AUR Documentation
- [Arch User Repository](https://wiki.archlinux.org/title/Arch_User_Repository)
- [Creating Packages](https://wiki.archlinux.org/title/Creating_packages)
- [AUR Submission Guidelines](https://wiki.archlinux.org/title/AUR_submission_guidelines)
- [PKGBUILD](https://wiki.archlinux.org/title/PKGBUILD)
- [Makepkg](https://wiki.archlinux.org/title/Makepkg)

## Notes

This package includes a patch to rename the desktop entry and executable to `js8call-improved` to avoid conflicts with the original `js8call` package.

This is a bit of future proofing because settings do conflict with the current 2.2.0 version of the `js8call` package.
We may replace the `conflicts` with `provides` depending on how the future development of `js8call-improved` goes. 
I noticed them chaning the exe name back to js8call after the 2.4.0 release.
