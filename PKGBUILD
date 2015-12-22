# Maintainer: Sauyon Lee <sauyonl@sauyon.com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Marc Coiffier <marc.coiffier@gmail.com>

pkgname=systemd-urxvt-daemon
pkgver=1.1
pkgrel=1
pkgdesc="A per-user URxvt daemon service for systemd"
url='https://wiki.archlinux.org/index.php/Rxvt-unicode#systemd'
license=('GPL')

install=urxvtd.install
arch=('any')

source=('urxvtd.service')
md5sums=('b28dd5be8dfe20d46da5bb49782c8f9e')

package() {
  install -Dm644 "$srcdir"/urxvtd.service "$pkgdir"/usr/lib/systemd/user/urxvtd.service
}
