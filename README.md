# atom-editor-arch
This PKGBUILD provides the Atom text editor with the following additional packages installed:

* [`about-arch`](https://atom.io/packages/about-arch) &mdash; which provides an alternate About page.
* [`language-archlinux`](https://atom.io/packages/language-archlinux) &mdash; which makes Arch Linux package development easier.
* [`language-gfm2`](https://atom.io/packages/language-gfm2) &mdash; which is installed instead of the core package, [`language-gfm`](https://atom.io/packages/language-gfm2), as it provides syntax-highlighting for HTML and Liquid in GFM documents.
* [`language-ini-desktop`](https://atom.io/packages/language-ini-desktop) &mdash; which provides syntax-highlighting for desktop configuration files.
* [`language-liquid`](https://atom.io/packages/language-liquid) &mdash; which provides syntax-highlighting for HTML and Liquid.
* [`language-unix-shell`](https://atom.io/packages/language-unix-shell) &mdash; which provides superior syntax-highlighting for shell scripts than the core Atom package, [`language-shellscript`](https://atom.io/packages/language-shellscript).

and the following themes installed (note, all core themes were removed, to reduce the size of this package):

* [`dark-bint-syntax`](https://atom.io/themes/dark-bint-syntax)
* [`fusion-ui`](https://atom.io/themes/fusion-ui)

Additionally, the `exception-reporting` and `metrics` packages were removed for privacy concerns. 
