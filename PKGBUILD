# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander
pkgver=3.1.8
pkgrel=1
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL3')
makedepends=('readline')
depends=('util-linux' 'coreutils')
optdepends=('ccd2iso: BIN/IMG conversion support' 'mdf2iso: MDF/MDS conversion support')
md5sums=('332a826cd4946cb6e2ae33400ac2a03b')

source=("https://github.com/siyia2/iso-commander/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/$pkgname-${pkgver}"
	make
}

package() {
  
  cd "${srcdir}/$pkgname-${pkgver}"
  
  install -Dm755 isocmd "$pkgdir/usr/bin/isocmd"
  
}
