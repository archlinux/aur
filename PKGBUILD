pkgname=xabber-web
pkgver=1.0.13
pkgrel=1
pkgdesc="Open source XMPP client for Web"
arch=(any)
url="https://github.com/redsolution/xabber-web"
license=('GPL')
depends=()
source=("$pkgname::https://github.com/redsolution/xabber-web/archive/$pkgver.tar.gz")
sha256sums=('b3d7ef13ed65d3d4630f4448f5b2d8db6b4dfe73cc09b03fca713bf1cd986386')

package() {
	install -dm0755 "$pkgdir"/usr/share/webapps/xabber-web
	cp -a "$srcdir"/xabber-web-$pkgver/* "$pkgdir"/usr/share/webapps/xabber-web/
}
