# Maintainer: Radon Rosborough <radon.neon@gmail.com>

pkgname='pass-ln'
pkgver='2.0.0'
pkgrel='1'
pkgdesc="Pass extension for creating symbolic links"
arch=('any')
url="https://github.com/raxod502/pass-ln"
license=('MIT')
depends=('pass' 'coreutils')
source=('https://github.com/raxod502/pass-ln/releases/download/v2.0.0/pass-ln-2.0.0.tar.gz')
sha256sums=('e9521261347c499409a76d6937304ff7ac6ed190cc212bac58cf893a8bb72d72')

package() {
  cd "$srcdir/pass-ln-2.0.0"

  install -D lib/password-store/extensions/ln.bash "$pkgdir/usr/lib/password-store/extensions/ln.bash"
  install -D share/doc/pass-ln/CHANGELOG.md "$pkgdir/usr/share/doc/pass-ln/CHANGELOG.md"
  install -D share/man/man1/pass-ln.1 "$pkgdir/usr/share/man/man1/pass-ln.1"
}

# vim:set ts=2 sw=2 et:

# Local Variables:
# mode: sh
# sh-basic-offset: 2
# sh-shell: bash
# End:
