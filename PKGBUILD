# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=mounter-elite-plus
pkgver=2.1.9
pkgrel=1
pkgdesc='State of the art ISO Mounter/Converter for the terminal, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/mounter-elite-plus"
license=('GPL3')
depends=('bash' 'coreutils' 'readline' 'sudo')
optdepends=('ccd2iso: BIN/IMG conversion support' 'mdf2iso: MDF/MDS conversion support')
md5sums=('ada4aa871af426fd135d5459f5829dba')

source=("https://github.com/siyia2/mounter-elite-plus/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/$pkgname-${pkgver}"
	make
}

package() {
  
  cd "${srcdir}/$pkgname-${pkgver}"
  
  install -Dm755 mounter_elite_plus "$pkgdir/usr/bin/mounter_elite_plus"
  
}



