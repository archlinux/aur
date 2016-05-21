# Maintainer: Link Dupont <link@fastmail.com>

pkgname=system76-wallpapers
pkgver=16.04.1
pkgrel=1
pkgdesc="A collection of System76 Wallpapers"
arch=('any')
url="https://launchpad.net/system76-wallpapers"
license=('GPL')
source=("https://launchpad.net/~system76-dev/+archive/stable/+files/${pkgname}_${pkgver}.tar.gz")
md5sums=('c39c8f23906da9c67a292722f7cb3df8')

package() {
	cd "${pkgname}-${pkgver}"
	install -m755 -d ${pkgdir}/usr/share/backgrounds
	install -m644 -D backgrounds/* ${pkgdir}/usr/share/backgrounds/
	install -m644 -D ${pkgname}.xml ${pkgdir}/usr/share/gnome-background-properties/${pkgname}.xml
}
