# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 24/10/2010
pkgname=udev-polish-man
pkgver=128
pkgrel=1
pkgdesc='Udev Polish man pages'
arch=('any')
url='http://www.linux.pl/?id=news&show=4939'
license=('GPL')
makedepends=()
optdepends=()
source=("http://linux.pl/users/arctgx/man/$pkgname.tar.gz")
md5sums=('afed519802bb612eead1c3d915baa8c7')

build() {
  cd "$srcdir"
  install -dm 755 ${pkgdir}/usr/share/man/pl/man7 || return 1
  install -dm 755 ${pkgdir}/usr/share/man/pl/man8 || return 1
  gzip udev.7 -c > ${pkgdir}/usr/share/man/pl/man7/udev.7.gz || return 1
  gzip udevadm.8 -c > ${pkgdir}/usr/share/man/pl/man8/udevadm.8.gz || return 1
}

# vim:set ts=2 sw=2 et ft=sh:
