# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=nspawn
pkgver=0.5
pkgrel=1
pkgdesc="A wrapper around machinectl for easy-deployment of nspawn.org containers"
arch=('any')
url="https://github.com/nspawn/nspawn"
license=('GPL3')
depends=('systemd')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nspawn/nspawn/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fbebb7991b6a8e40a4031e2976c031e43bf62f9d6d04fff8627ff8487e234eb9')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m 755 nspawn "${pkgdir}/usr/bin/nspawn"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/nspawn/LICENSE"
}
