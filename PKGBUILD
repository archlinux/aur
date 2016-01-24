# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sabart Otto - Seberm <seberm[at]seberm[dot]com>

pkgname=ctstream
pkgver=24
pkgrel=1
pkgdesc="Get URLs of Czech Television video streams for specific entry page"
arch=('any')
url="http://xpisar.wz.cz/ctstream"
license=('GPLv3')
depends=('perl' 'perl-libwww' 'perl-xml-xpath' 'perl-json') 
source=(http://xpisar.wz.cz/$pkgname/$pkgname-$pkgver)
md5sums=('a86368a7c474feb4ca9d5799d0b35c17')

package() {
  cd "${srcdir}"

  install -Dm755 $pkgname-$pkgver "${pkgdir}"/usr/bin/$pkgname
}

