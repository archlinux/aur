# Maintainer: lunainvictum (solisinvictum on GitHub) https://github.com/solisinvictum/vidoas
pkgname=vidoas
pkgver=1.1.0
pkgrel=1
pkgdesc="Safely edit the doas.conf file (like visudo for doas)"
arch=('any')
url="https://github.com/solisinvictum/vidoas"
license=('GPL-3.0-only')
depends=('bash' 'opendoas' 'util-linux')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('47b20a49659fb0a6506521b106f649b3e0d716f344b659b0debd6b8c7610f347')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 vidoas "$pkgdir/usr/bin/vidoas"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
