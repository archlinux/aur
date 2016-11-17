# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=quickbms
pkgver=0.7.6a
pkgrel=1
pkgdesc="Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much more."
url="http://aluigi.altervista.org/quickbms.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('lib32-lzo' 'lib32-bzip2' 'lib32-zlib' 'lib32-openssl' 'lib32-gcc-libs')
makedepends=('gcc-multilib')
provides=('quickbms')
conflicts=('quickbms')
# options='!emptydirs'
source=("quickbms_${pkgver}.zip::http://aluigi.altervista.org/papers/quickbms_src.zip")
md5sums=('8bd9af914e49fbe66405cf7ef2c7696d')

build() {
  cd $srcdir/src
  make
}

package() {
  install -Dm755 "$srcdir/src/quickbms" "$pkgdir/usr/bin/quickbms"
}

# vim:set ts=2 sw=2 et:
