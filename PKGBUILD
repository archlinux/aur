# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: linuxer <linuxer@artixlinux.org>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=ananicy-openrc
pkgver=1
pkgrel=1
pkgdesc="Ananicy - is Another auto nice daemon, with community rules support"
arch=('any')
url="https://github.com/Nefelim4ag/Ananicy"
license=('BSD')
depends=(ananicy openrc bash schedtool)
makedepends=(git make)
source=(ananicy.initd)
b2sums=('SKIP')
install=$pkgname.install

package() {
  mkdir -p $pkgdir/etc/init.d/
  cp "ananicy.initd" $pkgdir/etc/init.d/ananicy
  install=ananicy-openrc.install
}
