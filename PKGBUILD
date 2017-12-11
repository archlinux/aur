# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: 2ion <dev@2ion.de>
pkgname=ttf-zekton-rg
pkgver=4.001
pkgrel=3
pkgdesc="ZektonRg-Regular TTF font"
arch=('any')
url="http://www.dafont.com/de/zekton.font"
license=('custom:EULA')
depends=('fontconfig')
install=ttf.install
source=("${pkgname}-${pkgver}.zip::http://dl.dafont.com/dl/?f=zekton")
sha256sums=('316c840d3a30ba30b41685a9acfc3eff96f5cfdeab52c5cdf0f40db2385bf318')

package() {
  cd "$srcdir"
  install -Dm644 "zekton rg.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/ZektonRg-Regular.ttf"
  install -Dm644 "typodermic-eula-02-2014.pdf" "${pkgdir}/usr/share/doc/${pkgname}/EULA.pdf"
}

