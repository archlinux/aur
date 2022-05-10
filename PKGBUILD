# Maintainer: Radian LLC <contact+pass-ln@radian.codes>

pkgname='pass-ln'
pkgver='2.1.0'
pkgrel='1'
pkgdesc="Pass extension for creating symbolic links"
arch=('any')
url="https://github.com/radian-software/pass-ln"
license=('MIT')
depends=('pass' 'coreutils')
source=('https://github.com/radian-software/pass-ln/releases/download/v2.1.0/pass-ln-2.1.0.tar.gz')
sha256sums=('84ff8f2012c76d6429c29d0b0878f284cca5cda93336bd006d372e5e4c7968e7')

package() {
  cd "$srcdir/pass-ln-2.1.0"

  install -D lib/password-store/extensions/ln.bash "$pkgdir/usr/lib/password-store/extensions/ln.bash"
  install -D etc/bash_completion.d/pass-ln "$pkgdir/etc/bash_completion.d/pass-ln"
  install -D share/doc/pass-ln/CHANGELOG.md "$pkgdir/usr/share/doc/pass-ln/CHANGELOG.md"
  install -D share/man/man1/pass-ln.1 "$pkgdir/usr/share/man/man1/pass-ln.1"
}

# vim:set ts=2 sw=2 et:

# Local Variables:
# mode: sh
# sh-basic-offset: 2
# sh-shell: bash
# End:
