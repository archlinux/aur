# Maintainer: malacology
# Contributor: malacology

pkgname=tpsrelw
pkgver=1.74
pkgrel=1
pkgdesc="Relative warps analysis"
arch=('any')
url="http://sbmorphometrics.org/soft-tps.html"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("https://github.com/starsareintherose/tpsRelw/releases/download/${pkgver}/tpsRelw.zip" "tpsRelw.desktop" "tpsRelw.png")
md5sums=('6feca61cc39f332aea08d66a8e1cb0b4'
         '0d0982c6bd4cc8d8ccdaa3b25576a3ee'
         '48aa2b40a7d3e8490f0e89b2fb2a31d1')

package() {
  install -dm755 "$pkgdir"/usr/share/{tpsrelw,applications}
  mv "$srcdir"/tpsRelw/* "$pkgdir"/usr/share/tpsrelw
  install -Dm755 ${srcdir}/tpsRelw.png ${pkgdir}/usr/share/tpsrelw/tpsRelw.png
  install -Dm755 ${srcdir}/tpsRelw.desktop ${pkgdir}/usr/share/applications/tpsRelw.desktop
}
