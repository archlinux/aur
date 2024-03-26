# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=delance-langserver
pkgver="2024.3.101"
pkgrel=1
pkgdesc="A spear to the Python language server built with black magic"
arch=(any)
url="https://sr.ht/~self/delance/"
license=('0BSD')
depends=(nodejs)
makedepends=(npm)
source=(
	"https://registry.npmjs.org/@delance/runtime/-/runtime-$pkgver.tgz")
sha256sums=('bb90ce57f8870cb0f3c77a5b63b22b11c614f1509e25990f3aab84ae11d2a7ae')

package() {
	npm install -g --prefix "${pkgdir}/usr" "$srcdir/runtime-$pkgver.tgz"
	install -vDm644 */LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
