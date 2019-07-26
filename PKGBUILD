# Maintainer: Corbin Bartsch <corbin.bartsch@protonmail.com>
# Contributor: Rowan Decker <rdecker@scu.edu>

pkgname=tmetric-desktop
pkgver=19.3.0
pkgrel=1
pkgdesc="Simple time tracking software for teams of any size. Track tasks from multiple project management systems with one click."
arch=('x86_64')
url="https://tmetric.com"
license=('GPL')
groups=('')
depends=('gnome-themes-standard' 'libappindicator-gtk2')
provides=('tmetric')
conflicts=('tmetric')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://static.tmetric.com/desktop/download/linux/deb/amd64")
sha256sums_x86_64=('3c978a3e5e8db35aadf24792fe6cf8c46efddc88d10775af6fc9b2662a715b2e')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -DTm755 "${pkgdir}/usr/share/tmetricdesktop/TMetricDesktop" "${pkgdir}/usr/bin/${pkgname}"
}
