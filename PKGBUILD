# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander
pkgver=3.1.7
pkgrel=2
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL3')
makedepends=('readline')
depends=('util-linux' 'coreutils')
optdepends=('ccd2iso: BIN/IMG conversion support' 'mdf2iso: MDF/MDS conversion support')
md5sums=('56e9dfacb9e56361caef3d29a788b91e')

source=("https://github.com/siyia2/iso-commander/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/$pkgname-${pkgver}"
	make
}

package() {
  
  cd "${srcdir}/$pkgname-${pkgver}"
  
  install -Dm755 isocmd "$pkgdir/usr/bin/isocmd"
  
}
