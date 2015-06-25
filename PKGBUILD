# Maintainer: Bert Muennich <muennich at informatik.hu-berlin.de>

pkgname=oggted
pkgver=0.1
pkgrel=2
pkgdesc="command line ogg vorbis tag editor"
arch=(i686 x86_64)
license=('GPL')
url="http://github.com/muennich/oggted/"
depends=('taglib')
source=(https://github.com/downloads/muennich/oggted/$pkgname-$pkgver.tar.gz)
md5sums=('48156123922b18eb3326abb640dc495b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install
}
