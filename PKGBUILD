# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sabart Otto - Seberm <seberm[at]seberm[dot]com>

pkgname=ctstream
pkgver=27
pkgrel=1
pkgdesc="Get URLs of Czech Television video streams for specific entry page"
arch=('any')
url="http://xpisar.wz.cz/ctstream"
license=('GPLv3')
depends=('perl' 'perl-libwww' 'perl-xml-xpath' 'perl-json') 
source=(http://xpisar.wz.cz/$pkgname/$pkgname-$pkgver{,.asc})
validpgpkeys=('4B528393E6A3B0DFB2EF3A6412C9C5C767C6FAA2')
sha256sums=('63af4a1895f893fda435cb5e18b6a0430c8212105133326d50f328fab5e448fd'
            'SKIP')

package() {
  cd "${srcdir}"

  install -Dm755 $pkgname-$pkgver "${pkgdir}"/usr/bin/$pkgname
}

