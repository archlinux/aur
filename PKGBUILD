# Maintainer: Aaron Liu <aaron li u 0    1	3   0  @ gmail.com>
pkgname=plasma6-applets-wunderground
pkgver=3.7.12
pkgrel=1
pkgdesc="Plasmoid for displaying weather information from Wunderground decentralized stations"
arch=('any')
license=('GPL-2.0-or-later')
url='https://github.com/k-donn/plasmoid-wunderground'
depends=('libplasma>6' 'qt6-5compat' 'kirigami' 'ksvg' 'qt6-declarative' 'kdeclarative' 'kquickcharts' 'kcmutils')
source=("git+https://github.com/k-donn/plasmoid-wunderground.git#tag=v${pkgver}")
b2sums=('a51d6ffca3876d1187dea980a91080276a03060ae5cda0c380056c7f60719518c28dad2972a4f48de74668dd3ac425d2e7404c97a13f9a5f2b4d5503c7b4556f')

package() {
	mkdir -p "${pkgdir}/usr/share/plasma/plasmoids/com.github.k-donn.plasmoid-wunderground/"
	cp -rT "${srcdir}/plasmoid-wunderground/plasmoid" "${pkgdir}/usr/share/plasma/plasmoids/com.github.k-donn.plasmoid-wunderground"
}
