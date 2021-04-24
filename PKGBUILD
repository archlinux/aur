# Maintainer: robertfoster
pkgname=roomjuice
pkgver=0.3.5
pkgrel=1
pkgdesc="A multi-user jukebox web application. You can stream the music to other people as well."
url="http://grecni.com/roomjuice/"
arch=(any)
optdepends=('apache')
depends=('taginfo' 'php' 'mlocate')
source=("http://grecni.com/${pkgname}/dl/${pkgname}-${pkgver}.tar.bz2")
license=('GPL2')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/srv/http/"
  cp -r "${pkgname}-${pkgver}" "${pkgdir}/srv/http/${pkgname}"
}

sha256sums=('3604bb80ab6e1422cebfba699fd8c46f436a17c957a74d0447933783ef3c2af0')
