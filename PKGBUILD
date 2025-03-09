pkgname=sfcompute-cli
pkgver=0.3.1
pkgrel=1
pkgdesc="This is the San Francisco Compute command line tool."
arch=('x86_64')
url="https://github.com/sfcompute/cli"
license=('unknown')
depends=()
makedepends=('unzip')
provides=('sfcompute-cli')
source=("$pkgname-$pkgver.zip::https://github.com/sfcompute/cli/releases/download/$pkgver/sf-x86_64-unknown-linux-gnu.zip")
sha256sums=('bd60fcef908d29368ef781e600c500b46555ce392f85b26a110fb42722c6ddee')
options=('!strip')

package() {
  install -dm755 "$pkgdir/usr/bin"
  unzip -o "$srcdir/$pkgname-$pkgver.zip"
  install -Dm755 "sf-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/sf"
}
