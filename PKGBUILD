pkgname=rmate
pkgver=1.5.8
pkgrel=1
pkgdesc="rmate allows activate TextMate from an ssh session"
arch=('any')
license=('unknown')
url='http://blog.macromates.com/2011/mate-and-rmate/'
depends=('ruby')
source=(${pkgname}-${pkgver}::https://github.com/textmate/rmate/archive/v${pkgver}.tar.gz)
sha256sums=('40be07ae251bfa47b408eb56395dd2385d8e9ea220a19efd5145593cd8cbd89c')

package() {
	mkdir -p -m 0755 "$pkgdir/usr/bin/"
	install -v -m 0555 -o root -p "$srcdir"/${pkgname}-${pkgver}/bin/rmate -t "$pkgdir/usr/bin/"
}
