# Maintainer: restitux <restitux at ohea dot xyz>

pkgname=apollo-rover-bin
pkgver=0.26.2
pkgrel=1
pkgdesc="CLI for Apollo's suite of GraphQL developer productivity tools (binary release)"
arch=('x86_64')
url='https://github.com/apollographql/rover'
license=('MIT')
depends=('gcc-libs' 'zlib')
conflicts=('apollo-rover')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rover-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('5952ddeeee63bc3a5cc487c29cd07f04321fbed0da5b4958284764ce899c3dc6')

package() {
  install -D "dist/rover" -t "$pkgdir/usr/bin/"
  install -Dm644 "dist/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "dist/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
