# Maintainer: restitux <restitux at ohea dot xyz>

pkgname=apollo-rover-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="CLI for Apollo's suite of GraphQL developer productivity tools (binary release)"
arch=('x86_64')
url='https://github.com/apollographql/rover'
license=('MIT')
depends=('gcc-libs' 'zlib')
conflicts=('apollo-rover')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rover-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('1a2c115c0186e4dde32d0e4e20f3371b7799168bc5a0b04444acb522e9ad2e0c')

package() {
	install -D "dist/rover" -t "$pkgdir/usr/bin/"
	install -Dm644 "dist/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "dist/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
