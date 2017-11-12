# Maintainer: Timo Schwichtenberg <therealbassx at yahoo dot de>
# Contributor: Link Dupont <link@fastmail.com>

pkgname=system76-wallpapers
pkgver=17.04.0
pkgrel=1
pkgdesc="A collection of System76 Wallpapers"
arch=('any')
url="https://launchpad.net/system76-wallpapers"
license=('GPL')
source=("https://launchpad.net/~system76-dev/+archive/stable/+files/${pkgname}_${pkgver}.tar.gz")
sha256sums=('bcf2abce69f62594e6a0a76451cc599c1a181967df5dad59b85295d181e21c39')

package() {
	cd "${srcdir}/${pkgname}"
	install -m755 -d ${pkgdir}/usr/share/backgrounds
	install -m644 -D backgrounds/* ${pkgdir}/usr/share/backgrounds/
	install -m644 -D ${pkgname}.xml ${pkgdir}/usr/share/gnome-background-properties/${pkgname}.xml
}
