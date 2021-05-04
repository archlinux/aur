# Maintainer: Winux <winuxlinux11@gmail.com>

pkgname=nature-wallpapers
pkgver=1.1
pkgrel=1
pkgdesc='Collection of nature wallpapers'
arch=('any')
url='https://gitlab.com/winux1/nature-wallpapers/'
license=('unknown')
source=("${pkgname}-v${pkgver}.tar.gz::${url}-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
md5sums=('3c053879bc56931b4ed878dcc53bfa5c')

package() {
	cd "$srcdir/${pkgname}-v${pkgver}"
	install -d "${pkgdir}/usr/share/backgrounds/${pkgname}"
        install -m644 *.jpg "${pkgdir}/usr/share/backgrounds/${pkgname}/"
}
