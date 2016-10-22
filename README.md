This repository contains `PKGBUILD`s and related files necessary to build Atom
and Electron binary packages for [Arch Linux][arch]. This repository was originally forked
from [tensor5/arch-atom][arch-atom], the `atom-bleeding` package can be installed
simultaneously to the `atom-editor` package and related stable Atom packages in the AUR and
my GitHub repositories. They can also be simultaneously installed to the `atom` and `apm`
packages in the `[community]` repository. Pre-built packages are available by enabling
[`[pkgbuild-current]`](https://github.com/fusion809/PKGBUILDs/releases/tag/current)
repository in `/etc/pacman.conf`:

```sh
[pkgbuild-current]
Server = https://github.com/fusion809/PKGBUILDs/releases/download/current/
SigLevel = PackageOptional
```

I recommend at least using this pre-built Electron package, as building Electron manually
using the PKGBUILD provided in this repository takes at least 2 hours.

Check the Arch [wiki][atom-wiki] for more information. `atom-bleeding` has the latest versions of all core packages, except with a few packages removed, such as:

* [`exception-reporting`](https://github.com/atom/exception-reporting)
* [`metrics`](https://github.com/atom/metrics)

the following packages replaced (where <code>&rarr;</code> denotes "replaced with"):

* [`about`](https://github.com/atom/about) &rarr; [`about-arch`](https://github.com/fusion809/about)
* [`language-gfm`](https://github.com/atom/language-gfm) &rarr; [`language-gfm2`](https://github.com/fusion809/language-gfm2)
* [`language-shellscript`](https://github.com/atom/language-shellscript) &rarr; [`language-unix-shell`](https://github.com/fusion809/language-shellscript)


# Build method

Our method of building Atom is slightly different from the one officially
recommended by the Atom team.

If you follow [Atom build instructions][atom-build], the build system will
download a fairly old binary copy of Electron and include it in your distribution. If you
follow [Electron build instructions][electron-build], it will use a binary copy
of [libchromiumcontent][libchromiumcontent], the library upon which Electron is
based.

Our packages, on the other hand, are entirely built for source.

Another difference with upstream builds is that they ship Atom, Electron and apm
(the Atom package manager) all in one distribution, and they rename the
`electron` executable as `atom`. We ship three distinct packages named atom,
electron and nodejs-atom-package-manager, and the atom package depends on the
other two. Moreover, nodejs-atom-package-manager uses the system nodejs
installation, rather than downloading a binary node executable as the official
build does.

[arch]: https://www.archlinux.org/ "Arch Linux"
[arch-atom]: https://github.com/tensor5/arch-atom "Original arch-atom repository"
[atom-build]: https://github.com/atom/atom/blob/master/docs/build-instructions/linux.md
[atom-wiki]: https://wiki.archlinux.org/index.php/Atom "Atom - ArchWiki"
[electron-build]: https://github.com/electron/electron/blob/master/docs/development/build-instructions-linux.md
[libchromiumcontent]: https://github.com/atom/libchromiumcontent
