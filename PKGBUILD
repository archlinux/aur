# Maintainer: Aaron Liu <aaron li u 0    1	3   0  @ gmail.com>
pkgname=plasma6-applets-wunderground
pkgver=3.7.6
pkgrel=1
pkgdesc="Plasmoid for displaying weather information from Wunderground decentralized stations"
arch=('any')
license=('GPL-2.0-or-later')
url='https://github.com/k-donn/plasmoid-wunderground'
depends=('libplasma>6' 'qt6-5compat' 'kirigami' 'ksvg' 'qt6-declarative' 'kdeclarative' 'kquickcharts' 'kcmutils')
source=("git+https://github.com/k-donn/plasmoid-wunderground.git#tag=v${pkgver}")
b2sums=('cc4390c5bd3becf9b2550c89702aad2ba54b59ead2e17cb882b2039b7cd4c3db4fa875a41e5b14179194b58edebedac2efc889db00b8820bd127e9be5e28da5a')

package() {
	mkdir -p "${pkgdir}/usr/share/plasma/plasmoids/com.github.k-donn.plasmoid-wunderground/"
	cp -rT "${srcdir}/plasmoid-wunderground/plasmoid" "${pkgdir}/usr/share/plasma/plasmoids/com.github.k-donn.plasmoid-wunderground"
}
