# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=mounter-elite-plus
pkgver=2.4.2
pkgrel=2
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/mounter-elite-plus"
license=('GPL3')
makedepends=('readline')
depends=('bash' 'coreutils' 'sudo')
optdepends=('ccd2iso: BIN/IMG conversion support' 'mdf2iso: MDF/MDS conversion support')
md5sums=('d2b4f2f2f156e2d863fdbf33593c184f')

source=("https://github.com/siyia2/mounter-elite-plus/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/$pkgname-${pkgver}"
	make
}

package() {
  
  cd "${srcdir}/$pkgname-${pkgver}"
  
  install -Dm755 mounter_elite_plus "$pkgdir/usr/bin/mounter_elite_plus"
  
}



