# Maintainer: Guillaume Raffin <theelectronwill@gmail.com>
pkgname=bloop-systemd
pkgver=1.0.0
pkgrel=2
pkgdesc="systemd service for Bloop"
arch=(any)
license=('Apache')
depends=('bloop' 'systemd')
source=("bloop.service")
sha256sums=('9bf9e06e12813613e59c9bc63c4e2796d51466845ae22f8deb8557e20c4a68f7')

package() {
  # copy systemd service file
  install -Dm644 "$srcdir"/bloop.service "$pkgdir"/usr/lib/systemd/user/bloop.service
}
