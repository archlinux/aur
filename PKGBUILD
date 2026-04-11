pkgname=cachefetch-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Get cache file sizes in your computer. Cross-platform Linux, Windows, MacOS supported."
arch=('x86_64')
url="https://github.com/ErenayDev/cachefetch"
license=('MIT')
depends=()
source=("cachefetch-bin-0.1.0.tar.gz::https://github.com/ErenayDev/cachefetch/releases/download/v0.1.0/cachefetch-x86_64-unknown-linux-gnu-0.1.0.tar.gz" "LICENSE::https://raw.githubusercontent.com/ErenayDev/cachefetch/v0.1.0/LICENSE")
sha256sums=('cda99295ccd58bd96b1821f41f729b177189fa186ebb5c5273d93024c797cd01' 'SKIP')

package() {
  install -Dm755 "$srcdir/cachefetch" "$pkgdir/usr/bin/cachefetch"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
