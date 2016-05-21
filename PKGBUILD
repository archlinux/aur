# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

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
