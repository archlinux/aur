pkgname=theme.sh
provides=("${pkgname}")
pkgver=0.0.2
pkgrel=2
arch=('any')
url="https://github.com/lemnos/theme.sh"
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f6cb6ae5eac95536d5a00c64714758a32d1724edf5971277530f8795b09e6454')

package() {
  cd "$pkgname-$pkgver"
	chmod +x "theme.sh"
  install -Dm755 "theme.sh" "$pkgdir/usr/bin/theme.sh"
}
