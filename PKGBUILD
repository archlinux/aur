# Maintainer: restitux <restitux at ohea dot xyz>

pkgname=apollo-rover-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="CLI for Apollo's suite of GraphQL developer productivity tools (binary release)"
arch=('x86_64')
url='https://github.com/apollographql/rover'
license=('MIT')
depends=('gcc-libs' 'zlib')
conflicts=('apollo-rover')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rover-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('2fa8ed4e67b2ed7dd351bc4923e1f404eb012dfe5bb2cb2d6e7f26f5fc32108b')

package() {
	install -D "dist/rover" -t "$pkgdir/usr/bin/"
	install -Dm644 "dist/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "dist/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
