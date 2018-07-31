# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>
pkgname=timecamp
pkgver=1.4.3.3
pkgrel=1
pkgdesc="Client application for TimeCamp software"
arch=('x86_64')
url="https://www.timecamp.com/"
license=('custom')
depends=('gtk2' 'libsm' 'libnotify' 'libxss' 'libappindicator-gtk2')
install=${pkgname}.install
source=("https://www.timecamp.com/downloadsoft/${pkgver}/TimeCampSetup_LinAmd64-${pkgver}.tar.gz")
sha256sums=("51213dd2db59d8b4daa801682d5ec062d44341410a3fda4479d25b6dfc71264a")

package(){
	# Extract package data
  ar x timecamp.deb
	tar xzf data.tar.gz -C "${pkgdir}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s /usr/share/timecamp/timecamp "${pkgdir}/usr/bin/timecamp"
}
