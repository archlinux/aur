# Maintainer: Timo Schwichtenberg <therealbassx at yahoo dot de>
# Contributor: Link Dupont <link@fastmail.com>

pkgname=system76-wallpapers
pkgver=18.04.2~1525874807~18.04~d6171e2~dev
pkgrel=1
pkgdesc="A collection of System76 Wallpapers"
arch=('any')
url="https://launchpad.net/system76-wallpapers"
license=('GPL')
source=("https://launchpad.net/~system76-dev/+archive/stable/+files/${pkgname}_${pkgver}.tar.xz")
sha256sums=('dfe9b8c7092ae83d055943fcfeb8463cd14dffe8768e7af2caa663eec2675f2c')

package() {
	cd "${srcdir}"
	install -m755 -d ${pkgdir}/usr/share/backgrounds
	install -m644 -D d6171e2708cb91fc3f5a7e6749cbfb27a547ca9f_bionic/backgrounds/* ${pkgdir}/usr/share/backgrounds/
	install -m644 -D d6171e2708cb91fc3f5a7e6749cbfb27a547ca9f_bionic/${pkgname}.xml ${pkgdir}/usr/share/gnome-background-properties/${pkgname}.xml
}
