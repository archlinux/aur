# Maintainer: Aaron Liu <aaron li u 0    1	3   0  @ gmail.com>
pkgname=plasma6-applets-wunderground
pkgver=3.7.8
pkgrel=1
pkgdesc="Plasmoid for displaying weather information from Wunderground decentralized stations"
arch=('any')
license=('GPL-2.0-or-later')
url='https://github.com/k-donn/plasmoid-wunderground'
depends=('libplasma>6' 'qt6-5compat' 'kirigami' 'ksvg' 'qt6-declarative' 'kdeclarative' 'kquickcharts' 'kcmutils')
source=("git+https://github.com/k-donn/plasmoid-wunderground.git#tag=v${pkgver}")
b2sums=('b1da02a38a0d161d043cd9bda0db98b7c3bb8840021cc50dd8f9a2b34aedca90724df8ee700fb20543190611747f1d117d7583ed485107ff55252dd5ed372c00')

package() {
	mkdir -p "${pkgdir}/usr/share/plasma/plasmoids/com.github.k-donn.plasmoid-wunderground/"
	cp -rT "${srcdir}/plasmoid-wunderground/plasmoid" "${pkgdir}/usr/share/plasma/plasmoids/com.github.k-donn.plasmoid-wunderground"
}
