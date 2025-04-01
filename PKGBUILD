pkgname=sfcompute-cli
pkgver=0.8.0
pkgrel=1
pkgdesc="This is the San Francisco Compute command line tool."
arch=('x86_64')
url="https://github.com/sfcompute/cli"
license=('unknown')
depends=()
makedepends=('unzip')
provides=('sfcompute-cli')
source=("$pkgname-$pkgver.zip::https://github.com/sfcompute/cli/releases/download/$pkgver/sf-x86_64-unknown-linux-gnu.zip")
sha256sums=('8aaa099f95ec988a67224a2410cf5302021480f5e8c74e1f599f66dbdf19def0')
options=('!strip')

package() {
  install -dm755 "$pkgdir/usr/bin"
  unzip -o "$srcdir/$pkgname-$pkgver.zip"
  install -Dm755 "sf-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/sf"
}
