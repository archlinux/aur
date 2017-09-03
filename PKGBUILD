# Maintainer: Mornielome <stuff@lukasjacobs.de>
# Contributors: c0ldcat <firez199984@gmail.com>, KbanKiller
pkgname=marvin
pkgver=17.22.0
pkgrel=1
pkgdesc="Intuitive applications and API for chemical sketching, visualization and data exploration"
arch=('any')
url="http://www.chemaxon.com"
license=('proprietary')
depends=('jre8-openjdk')
source=("https://dl.chemaxon.com/marvin/$pkgver/Marvin_linux_$pkgver.rpm"
"MarvinSketch.desktop"
"marvin-sketch-symbolic.svg")
md5sums=('b4127af6b5f4317afd3559024486f57f'
'63b667e3188ffe688f516848e5db66c6'
'e6758f94b843b97804112fa0420ba1bb')

package() {
install -Dm755 MarvinSketch.desktop ${pkgdir}/usr/share/applications/MarvinSketch.desktop

cp -R opt ${pkgdir}/opt

install -Dm644 opt/chemaxon/marvinsuite/.install4j/MarvinSketch.png ${pkgdir}/usr/share/pixmaps/marvin-sketch.png
install -Dm644 marvin-sketch-symbolic.svg ${pkgdir}/usr/share/pixmaps/marvin-sketch-symbolic.svg
}
