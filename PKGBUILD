# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dns2tcp-zfl9
_pkgbase=dns2tcp
pkgver=1.1.0
pkgrel=1
pkgdesc='utility to convert dns query from udp to tcp'
arch=('x86_64' 'aarch64')
url="https://github.com/zfl9/dns2tcp"
license=('GPL3')
conflicts=('dns2tcp')
provides=('dns2tcp')
depends=()
source=("$_pkgbase-$pkgver::https://github.com/zfl9/dns2tcp/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
  cd $_pkgbase-${pkgver}
  make DESTDIR=/usr/bin
}

package() {
  cd $_pkgbase-${pkgver}
  make DESTDIR=$pkgdir/usr/bin/ install
}
