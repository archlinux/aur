# Maintainer: Corbin Bartsch <corbin.bartsch@protonmail.com>
# Contributor: Rowan Decker <rdecker@scu.edu>

pkgname=tmetric-desktop
pkgver=18.2.4
pkgrel=1
pkgdesc="Simple time tracking software for teams of any size. Track tasks from multiple project management systems with one click."
arch=('i686' 'x86_64')
url="https://tmetric.com"
license=('GPL')
groups=('')
depends=('gnome-themes-standard' 'libappindicator-gtk2')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_i686=("https://static.tmetric.com/desktop/download/linux/deb/i386")
source_x86_64=("https://static.tmetric.com/desktop/download/linux/deb/amd64")
sha256sums_i686=('80a26901b0fd7bc9d3ba138d74806135632ea73ec2adb557a443069320af25aa')
sha256sums_x86_64=('fe3602ea0a6a633d91114a643ab0c112be79e4ed013acc1a9852bdef2060c276')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -DTm755 "${pkgdir}/usr/share/tmetricdesktop/TMetricDesktop" "${pkgdir}/usr/bin/${pkgname}"
}
