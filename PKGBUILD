# Maintainer: 2ion <dev@2ion.de>
pkgname=ttf-zekton-rg
pkgver=4.001
pkgrel=2
pkgdesc="ZektonRg-Regular TTF font"
arch=('any')
url="http://www.dafont.com/de/zekton.font"
license=('custom:EULA')
depends=('fontconfig')
install=ttf.install
source=("${pkgname}-${pkgver}.zip::http://dl.dafont.com/dl/?f=zekton")
md5sums=('00aedce66b483548672714b2420f4210')

package() {
  cd "$srcdir"
  install -Dm644 "zekton rg.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/ZektonRg-Regular.ttf"
  install -Dm644 "typodermic-eula-02-2014.pdf" "${pkgdir}/usr/share/doc/${pkgname}/EULA.pdf"
}
