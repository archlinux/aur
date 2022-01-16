# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sabart Otto - Seberm <seberm[at]seberm[dot]com>

pkgname=ctstream
pkgver=31
pkgrel=1
pkgdesc="Get URLs of Czech Television video streams for specific entry page"
arch=('any')
url="http://xpisar.wz.cz/ctstream"  #https://src.fedoraproject.org/rpms/ctstream
license=('GPL3')
depends=('perl' 'perl-libwww' 'perl-xml-xpath' 'perl-json')
source=(http://xpisar.wz.cz/$pkgname/$pkgname-$pkgver{,.asc})
validpgpkeys=('4B528393E6A3B0DFB2EF3A6412C9C5C767C6FAA2')
sha256sums=('58ebfd4c2a7789854d46b5059233e35a74afadab9e805c8efc7bd577c8fb4372'
            'SKIP')

package() {
  cd "${srcdir}"

  install -Dm755 $pkgname-$pkgver "${pkgdir}"/usr/bin/$pkgname
}

