# Maintainer: r20d20 <r20d20@web.de>
pkgname=jameica-nightly
pkgver=2.7.0
pkgrel=1
pkgdesc="Jameica Plattform"
arch=(i686 x86_64)
url="http://www.willuhn.de/products/jameica/"
license=('GPL')
depends=('java-runtime>=1.6')
makedepends=('unzip')
source=("http://www.willuhn.de/products/jameica/releases/nightly/jameica-$pkgver-nightly-linux64.zip" "jameica.desktop")
md5sums=('SKIP'
         'c5915975edcf2ef695f57e93983ebbe6')

package() {
	mkdir -p ${pkgdir}/usr/share/{java/jameica,applications}
	cp -R "${srcdir}/jameica" "${pkgdir}/usr/share/java"
	install -m 644 ${srcdir}/jameica.desktop ${pkgdir}/usr/share/applications
}