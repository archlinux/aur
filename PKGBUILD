# Maintainer: Corbin Bartsch <corbin.bartsch@protonmail.com>
# Contributor: Rowan Decker <rdecker@scu.edu>

pkgname=tmetric-desktop
pkgver=19.1.1
pkgrel=1
pkgdesc="Simple time tracking software for teams of any size. Track tasks from multiple project management systems with one click."
arch=('i686' 'x86_64')
url="https://tmetric.com"
license=('GPL')
groups=('')
depends=('gnome-themes-standard' 'libappindicator-gtk2')
provides=('tmetric')
conflicts=('tmetric')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_i686=("https://static.tmetric.com/desktop/download/linux/deb/i386")
source_x86_64=("https://static.tmetric.com/desktop/download/linux/deb/amd64")
sha256sums_i686=('8748976ab5877298a5ea171f8422470c4e8cac5496ecef6cf3d4c016933ec92b')
sha256sums_x86_64=('b6007e1361b54cef9eed55c692ecabad194514c2fdd5baa4a198b8ac845d2b5c')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -DTm755 "${pkgdir}/usr/share/tmetricdesktop/TMetricDesktop" "${pkgdir}/usr/bin/${pkgname}"
}
