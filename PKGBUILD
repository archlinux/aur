# Contributor: johnnybash <georgpfahler@wachenzell.org>
# Contributor: r20d20 <r20d20@web.de>
# Maintainer: Square252 <square@0xfc.de>

pkgname=hibiscus-nightly
pkgver=2.11.0
pkgrel=2
pkgdesc="Hibiscus HBCI banking plugin for Jameica (nightly)"
arch=('any')
url="http://www.willuhn.de/products/hibiscus/"
license=('GPL')
depends=('jameica-nightly>=2.11')
makedepends=('unzip')
conflicts=('hibiscus')
source=(http://www.willuhn.de/products/hibiscus/releases/nightly/hibiscus-$pkgver-nightly.zip)
sha256sums=('SKIP')

package() {
	mkdir -p ${pkgdir}/usr/share/java/jameica/plugins
	cp -R "${srcdir}/hibiscus" "${pkgdir}/usr/share/java/jameica/plugins"
}
