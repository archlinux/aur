pkgname=sfcompute-cli
pkgver=0.1.4
pkgrel=1
pkgdesc="This is the San Francisco Compute command line tool."
arch=('x86_64')
url="https://github.com/sfcompute/cli"
license=('unknown')
depends=()
makedepends=('unzip')
provides=('sfcompute-cli')
source=("$pkgname-$pkgver.zip::https://github.com/sfcompute/cli/releases/download/$pkgver/sf-x86_64-unknown-linux-gnu.zip")
sha256sums=('758b64da9493381fd40e261db4ea458ad95fd5109643ab5f399d9b848683451f')
options=('!strip')

package() {
  install -dm755 "$pkgdir/usr/bin"
  unzip -o "$srcdir/$pkgname-$pkgver.zip"
  install -Dm755 "sf-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/sf"
}
