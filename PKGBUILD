# Maintainer: Fernando Ortiz <nandub+arch@nandub.info >
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=pod2man
pkgver=5.30.2
pkgrel=1
pkgdesc='Make pod2man easily accessible'
arch=(x86_64)
license=(GPL PerlArtistic)
url='https://perl.org/'
depends=(perl)

package() {
  # perl 5 places pod2man in /usr/bin/core_perl instead of /usr/bin,
  # for unknown reasons. This creates a symlink in what is what is now a more
  # conventional location.

  install -d "$pkgdir/usr/bin"
  ln -s /usr/bin/core_perl/pod2man "$pkgdir/usr/bin/pod2man"
}

# vim: ts=2 sw=2 et:
