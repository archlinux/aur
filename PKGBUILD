# Maintainer: Corbin Bartsch <corbin.bartsch@protonmail.com>
# Contributor: Rowan Decker <rdecker@scu.edu>

pkgname=tmetric-desktop
pkgver=20.2.4
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
source_x86_64=('https://static.tmetric.com/desktop/tmetric_desktop_20.2.4_amd64.deb')
sha256sums_x86_64=('106579fb9467ec13b681d4a8ea24d447dc2c2206dde5aa9e3c6c4c7896d2d91e')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -DTm755 "${pkgdir}/usr/share/tmetricdesktop/TMetricDesktop" "${pkgdir}/usr/bin/${pkgname}"
}
