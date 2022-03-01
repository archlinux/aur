# Maintainer: Radon Rosborough <radon.neon@gmail.com>

pkgname='pass-ln'
pkgver='1.0.0'
pkgrel='1'
pkgdesc="Pass extension for creating symbolic links"
arch=('any')
url="https://github.com/raxod502/pass-ln"
license=('MIT')
depends=('pass' 'coreutils')
source=('https://github.com/raxod502/pass-ln/releases/download/v1.0.0/pass-ln-1.0.0.tar.gz')
sha256sums=('828bcb6118a55182d9ae8db4f47465bc14b5488b09c8efe179fe845350844003')

package() {
  cd "$srcdir/pass-ln-1.0.0"

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
