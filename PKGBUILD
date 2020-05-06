pkgname=xabber-web
pkgver=2.0.2
pkgrel=1
pkgdesc="Open source XMPP client for Web"
arch=(any)
url="https://github.com/redsolution/xabber-web"
license=('GPL')
depends=()
source=("$pkgname::https://github.com/redsolution/xabber-web/archive/$pkgver.tar.gz")
sha256sums=('dd74bd6f218a705237ebe10baf42b11c424473fd5c3921bc2e466961dfa84ba0')

package() {
	install -dm0755 "$pkgdir"/usr/share/webapps/xabber-web
	cp -a "$srcdir"/xabber-web-$pkgver/* "$pkgdir"/usr/share/webapps/xabber-web/
}
