pkgname=xabber-web
pkgver=1.0.11
pkgrel=1
pkgdesc="Open source XMPP client for Web"
arch=(any)
url="https://github.com/redsolution/xabber-web"
license=('GPL')
depends=()
source=("$pkgname::https://github.com/redsolution/xabber-web/archive/$pkgver.tar.gz")
sha256sums=('93f3045f1b50620e3118f9db1373f5a56d0dce5c2175cd1e9a4c04c4e8ffb5df')

package() {
	install -dm0755 "$pkgdir"/usr/share/webapps/xabber-web
	cp -a "$srcdir"/xabber-web-$pkgver/* "$pkgdir"/usr/share/webapps/xabber-web/
}
