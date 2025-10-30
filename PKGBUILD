# Contributor: johnnybash <georgpfahler@wachenzell.org>
# Contributor: r20d20 <r20d20@web.de>
# Contributor: Square252 <square@0xfc.de>
# Maintainer: Harvey <harv at gmx dot de>

pkgname=hibiscus-nightly
pkgver=2.13.0
# Revision ändern wegen Updatescripts!
pkgrel=1
pkgdesc="Hibiscus HBCI banking plugin for Jameica (nightly)"
arch=('any')
url="http://www.willuhn.de/products/hibiscus/"
license=('GPL2')
depends=('jameica-nightly>=2.13')
makedepends=('unzip')
conflicts=('hibiscus')
source=(http://www.willuhn.de/products/hibiscus/releases/nightly/hibiscus-$pkgver-nightly.zip)
sha256sums=('SKIP')

package() {
	mkdir -p ${pkgdir}/usr/share/java/jameica/plugins
	cp -R "${srcdir}/hibiscus" "${pkgdir}/usr/share/java/jameica/plugins"
}
