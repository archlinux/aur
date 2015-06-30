# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot]com>

pkgname=streamcz-dl
pkgver=3
pkgrel=1
pkgdesc="Downloads video from Stream.cz"
url="http://xpisar.wz.cz/streamcz-dl"
arch=('any')
license=('GPLv3')
depends=('bash' 'grep' 'wget' 'sed') 
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=(http://xpisar.wz.cz/$pkgname/${pkgname}-${pkgver})

md5sums=('90ddc414ee2fe2a2bffdbdb13ae6425a')

package() {
	
	cd ${srcdir}
    install -m755 -d ${pkgdir}/usr/bin
    install -m755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
