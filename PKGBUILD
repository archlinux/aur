pkgname=theme.sh
pkgver=0.0.1
pkgrel=1
arch=('any')
url="https://github.com/lemnos/theme.sh"
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("ca9aadc15d9d06bd6a39e36cb9f15954c8cf934364388ea654fd883a6b2c0488")

package() {
  cd "$pkgname-$pkgver"
	chmod +x "theme.sh"
  install -Dm755 "theme.sh" "$pkgdir/usr/bin/theme.sh"
}
