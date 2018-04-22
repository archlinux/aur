# Maintainer: Timo Schwichtenberg <therealbassx at yahoo dot de>
# Contributor: Link Dupont <link@fastmail.com>

pkgname=system76-wallpapers
pkgver=18.04.1+1522964526+17.10~4666c43
pkgrel=1
pkgdesc="A collection of System76 Wallpapers"
arch=('any')
url="https://launchpad.net/system76-wallpapers"
license=('GPL')
source=("https://launchpad.net/~system76-dev/+archive/stable/+files/${pkgname}_${pkgver}.tar.xz")
sha256sums=('5d9ba5295a08b0f49481db1ef46488f8a0fedaa9e4fc9d5e2a55aa52c94cab16')

package() {
	cd "${srcdir}"
	install -m755 -d ${pkgdir}/usr/share/backgrounds
	install -m644 -D 4666c43e06ff1f7c4314f1e5e8fa4b36aafb8347_artful/backgrounds/* ${pkgdir}/usr/share/backgrounds/
	install -m644 -D 4666c43e06ff1f7c4314f1e5e8fa4b36aafb8347_artful/${pkgname}.xml ${pkgdir}/usr/share/gnome-background-properties/${pkgname}.xml
}
