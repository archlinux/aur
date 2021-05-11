# Maintainer: malacology
# Contributor: malacology

pkgname=tpsutil
pkgver=1.81
pkgrel=1
pkgdesc="tps file utility program"
arch=('any')
url="http://sbmorphometrics.org/soft-utility.html"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("https://github.com/starsareintherose/tpsUtil/releases/download/${pkgver}/tpsUtil.zip" "tpsUtil.desktop" "tpsUtil.png")
md5sums=('ef07f3ff1dcdb72b253a192f1861c6c9'
         '64baf6b610dcecc53a15342218579d18'
         '6e52ff5a9df8898532610845c973b23a')

package() {
  install -dm755 "$pkgdir"/usr/share/{tpsutil,applications}
  mv "$srcdir"/tpsUtil/* "$pkgdir"/usr/share/tpsutil
  install -Dm755 ${srcdir}/tpsUtil.png ${pkgdir}/usr/share/tpsutil/tpsUtil.png
  install -Dm755 ${srcdir}/tpsUtil.desktop ${pkgdir}/usr/share/applications/tpsUtil.desktop
}
