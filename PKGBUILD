# Maintainer: Eric Biggers <ebiggers3@gmail.com>

pkgname=bfast
pkgver=0.7.0a
pkgrel=2
pkgdesc='Blat-like Fast Accurate Search Tool; facilitates the fast and accurate mapping of short reads to reference sequences'
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/mediawiki/bfast/index.php?title=Main_Page"
license=('GPL2')
depends=('zlib' 'bzip2' 'perl')
source=(
"http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/0.7.0/${pkgname}-${pkgver}.tar.gz")

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
md5sums=('9b0574dce903ab83e39e371b0a3bbbc6')
