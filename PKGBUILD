# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sabart Otto - Seberm <seberm[at]seberm[dot]com>

pkgname=ctstream
pkgver=32
pkgrel=1
pkgdesc="Get URLs of Czech Television video streams for specific entry page"
arch=('any')
url="http://xpisar.wz.cz/ctstream"  #https://src.fedoraproject.org/rpms/ctstream
license=('GPL3')
depends=('perl' 'perl-libwww' 'perl-xml-xpath' 'perl-json')
source=(http://xpisar.wz.cz/$pkgname/$pkgname-$pkgver{,.asc})
validpgpkeys=('4B528393E6A3B0DFB2EF3A6412C9C5C767C6FAA2')
sha256sums=('44de49df2fb68faf155b65c97194fdec40c45afbabd1c4a4ab5e445fc88a36bb'
            'SKIP')

package() {
  cd "${srcdir}"

  install -Dm755 $pkgname-$pkgver "${pkgdir}"/usr/bin/$pkgname
}

