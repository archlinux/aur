# Maintainer: r20d20 <r20d20@web.de>
pkgname=hibiscus-nightly
pkgver=2.7.0
pkgrel=1
pkgdesc="Hibiscus Plugin for Jameica Plattform"
arch=(i686 x86_64)
url="http://www.willuhn.de/products/hibiscus/"
license=('GPL')
depends=('jameica-nightly>=2.7')
makedepends=('unzip')
conflicts=(hibiscus)
source=(http://www.willuhn.de/products/hibiscus/releases/nightly/hibiscus-$pkgver-nightly.zip)
md5sums=('SKIP')

package() {
	mkdir -p ${pkgdir}/usr/share/java/jameica/plugins
	cp -R "${srcdir}/hibiscus" "${pkgdir}/usr/share/java/jameica/plugins"
}