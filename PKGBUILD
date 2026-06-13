# Maintainer: restitux <restitux at ohea dot xyz>

pkgname=apollo-rover-bin
pkgver=0.40.0
pkgrel=1
pkgdesc="CLI for Apollo's suite of GraphQL developer productivity tools (binary release)"
arch=('x86_64')
url='https://github.com/apollographql/rover'
license=('MIT')
depends=('gcc-libs' 'zlib')
conflicts=('apollo-rover')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rover-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a3fc1466e6ceb7df19c2ce51ae582ce9749815988f8fb14218f874c562124604')

package() {
  install -D "dist/rover" -t "$pkgdir/usr/bin/"
  install -Dm644 "dist/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "dist/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
