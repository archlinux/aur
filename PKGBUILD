# Maintainer: Winux <winuxlinux11@gmail.com>

pkgname=nature-wallpapers
pkgver=1.0
pkgrel=1
pkgdesc='Collection of nature wallpapers'
arch=('any')
url='https://gitlab.com/winux1/nature-wallpapers/'
license=('unknown')
source=("${pkgname}-v${pkgver}.tar.gz::${url}-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
md5sums=('aeebbaf81bfcde5accff1e788c124606')

package() {
	cd "$srcdir/${pkgname}-v${pkgver}"
	install -d "${pkgdir}/usr/share/backgrounds/${pkgname}"
        install -m644 *.jpg "${pkgdir}/usr/share/backgrounds/${pkgname}/"
}