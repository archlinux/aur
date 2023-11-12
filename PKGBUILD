# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=mounter-elite-plus
pkgver=2.1.2
pkgrel=1
pkgdesc='A blazing fast and secure, ISO Mounter/Converter for the terminal, written in C++.'
arch=('x86_64')
url="https://github.com/siyia2/mounter-elite-plus"
license=('GPL3')
depends=('bash' 'coreutils' 'readline' 'sudo')
optdepends=('ccd2iso: BIN/IMG conversion support' 'mdf2iso: MDS/MDF conversion support')
md5sums=('ea9bfe850f3cdb91bea548cf523ed86d')

source=("https://github.com/siyia2/mounter-elite-plus/archive/v${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver
  make
}


package() {
  
  cd "${srcdir}/$pkgname-${pkgver}"
  
  make install
  
}



