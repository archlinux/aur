# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander
pkgver=2.9.1
pkgrel=2
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL3')
makedepends=('readline')
depends=('bash' 'util-linux' 'sudo')
optdepends=('ccd2iso: BIN/IMG conversion support' 'mdf2iso: MDF/MDS conversion support')
md5sums=('50a3a89e80f2cc4066f520392c015099')

source=("https://github.com/siyia2/iso-commander/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/$pkgname-${pkgver}"
	make
}

package() {
  
  cd "${srcdir}/$pkgname-${pkgver}"
  
  install -Dm755 mounter_elite_plus "$pkgdir/usr/bin/isocmd"
  
}
