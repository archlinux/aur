# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Lothar Gesslein <ulmen@cryptomilch.de>

pkgname=aoetools
pkgver=37
pkgrel=1
pkgdesc="ATA over Ethernet Tools"
arch=('i686' 'x86_64')
url="https://github.com/OpenAoE/aoetools/"
license=('GPL')
source=(https://github.com/OpenAoE/aoetools/archive/$pkgname-$pkgver.tar.gz)
sha256sums=('477e796f5c18e8c0e61b5d88e1759c68249e8e0210c2f3de2b98680e2cc63e32')

build() {
  cd "${srcdir}"/$pkgname-$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgname-$pkgver

  make DESTDIR="${pkgdir}" SBINDIR=/usr/bin install
}
