# Maintainer: malacology
# Contributor: malacology

pkgname=tpsdig
pkgver=2.31
pkgrel=1
pkgdesc="Digitize landmarks & outlines from image files, scanner, or video"
arch=('any')
url="http://sbmorphometrics.org/soft-dataacq.html"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("https://github.com/starsareintherose/tpsDig/releases/download/${pkgver}/tpsDig.zip" "tpsDig.desktop" "tpsDig.png")
md5sums=('eb6498c5b35c3c7d5355a15a456221b4'
         'ac6b8db75d56ed6d16edfb70d994afa5'
         '2e2e7c55e63e7a3892e49aab613aed35')

package() {
  install -dm755 "$pkgdir"/usr/share/{tpsdig,applications}
  mv "$srcdir"/tpsDig/* "$pkgdir"/usr/share/tpsdig
  install -Dm755 ${srcdir}/tpsDig.png ${pkgdir}/usr/share/tpsdig/tpsDig.png
  install -Dm755 ${srcdir}/tpsDig.desktop ${pkgdir}/usr/share/applications/tpsDig.desktop
}
