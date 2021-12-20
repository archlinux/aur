pkgname=theme.sh
provides=("${pkgname}")
pkgver=1.0.1
pkgrel=1
arch=('any')
url="https://github.com/lemnos/theme.sh"
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('603d33e340c7b8788b7b34c2196e59fbad53c6f336e80cf8dfd9b9e08298a95c')

package() {
  cd "$pkgname-$pkgver"
	chmod +x "theme.sh"
  install -Dm755 "theme.sh" "$pkgdir/usr/bin/theme.sh"
}
