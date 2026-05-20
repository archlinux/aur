# Maintainer: Aaron Liu <aaron li u 0    1	3   0  @ gmail.com>
pkgname=plasma6-applets-wunderground
pkgver=3.7.7
pkgrel=1
pkgdesc="Plasmoid for displaying weather information from Wunderground decentralized stations"
arch=('any')
license=('GPL-2.0-or-later')
url='https://github.com/k-donn/plasmoid-wunderground'
depends=('libplasma>6' 'qt6-5compat' 'kirigami' 'ksvg' 'qt6-declarative' 'kdeclarative' 'kquickcharts' 'kcmutils')
source=("git+https://github.com/k-donn/plasmoid-wunderground.git#tag=v${pkgver}")
b2sums=('30bc8e3e7d9e099a1296e62fb393eb6f0d9685d9d2e9eb61cb89f6a64d3d8c3b546826db866e9c0fdc539b1d157cb455832da6f73c341c0f3b455c57989b5bc2')

package() {
	mkdir -p "${pkgdir}/usr/share/plasma/plasmoids/com.github.k-donn.plasmoid-wunderground/"
	cp -rT "${srcdir}/plasmoid-wunderground/plasmoid" "${pkgdir}/usr/share/plasma/plasmoids/com.github.k-donn.plasmoid-wunderground"
}
