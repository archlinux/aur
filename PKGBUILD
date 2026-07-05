# Maintainer: Aaron Liu <aaron li u 0    1	3   0  @ gmail.com>
pkgname=plasma6-applets-wunderground
pkgver=3.7.10
pkgrel=1
pkgdesc="Plasmoid for displaying weather information from Wunderground decentralized stations"
arch=('any')
license=('GPL-2.0-or-later')
url='https://github.com/k-donn/plasmoid-wunderground'
depends=('libplasma>6' 'qt6-5compat' 'kirigami' 'ksvg' 'qt6-declarative' 'kdeclarative' 'kquickcharts' 'kcmutils')
source=("git+https://github.com/k-donn/plasmoid-wunderground.git#tag=v${pkgver}")
b2sums=('a6781e598fb0f580cedf592f81c8d557ffa1f07f2958a53ddfe8038f2a59f9258949ea036b532a8336b2ed2667cc858409ac3138dadd44de5f6054f51f5b59ce')

package() {
	mkdir -p "${pkgdir}/usr/share/plasma/plasmoids/com.github.k-donn.plasmoid-wunderground/"
	cp -rT "${srcdir}/plasmoid-wunderground/plasmoid" "${pkgdir}/usr/share/plasma/plasmoids/com.github.k-donn.plasmoid-wunderground"
}
