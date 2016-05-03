pkgname=udev-polish-man
pkgver=128
pkgrel=2
pkgdesc='Udev Polish man pages'
arch=('any')
url='http://www.linux.pl/?id=news&show=4939'
license=('GPL')
makedepends=()
optdepends=()
source=("http://linux.pl/users/arctgx/man/$pkgname.tar.gz")
sha256sums=('aebb0b3d6a9bd76a6eabb7ec97d466cfff2c85e0682e3107cf2e31b444a0c483')
package() {
  cd "$srcdir"
  install -dm 755 ${pkgdir}/usr/share/man/pl/man7
  install -dm 755 ${pkgdir}/usr/share/man/pl/man8
  gzip udev.7 -c > ${pkgdir}/usr/share/man/pl/man7/udev.7.gz
  gzip udevadm.8 -c > ${pkgdir}/usr/share/man/pl/man8/udevadm.8.gz
}

