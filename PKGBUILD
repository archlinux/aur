# Contributor: 100best
pkgname=iceweasel-https-everywhere
_pkgname=https-everywhere
pkgver=2017.12.6
pkgrel=1
pkgdesc="Browser extension that encrypts your communications with many major websites, making your browsing more secure."
arch=(any)
url=https://www.eff.org/https-everywhere
license=(GPL3)
depends=(iceweasel)
source=(https://www.eff.org/files/$_pkgname-$pkgver-eff.xpi)
noextract=($_pkgname-$pkgver-eff.xpi)
sha256sums=(006cba154d6559cd388d8b88330182e98f8c0e18f94d39d061a68e0e6123abca)

package() {
mv $_pkgname-$pkgver-eff.xpi https-everywhere-eff@eff.org.xpi
mkdir -p $pkgdir/usr/lib/iceweasel/browser/extensions/
install https-everywhere-eff@eff.org.xpi $pkgdir/usr/lib/iceweasel/browser/extensions/
}
