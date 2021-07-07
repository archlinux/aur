pkgname=theme.sh
provides=("${pkgname}")
pkgver=0.0.3
pkgrel=1
arch=('any')
url="https://github.com/lemnos/theme.sh"
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('327adfb22b91165dc7da559f58b8a8ce1cb6a462b7deb0b344f0527ef797c33b')

package() {
  cd "$pkgname-$pkgver"
	chmod +x "theme.sh"
  install -Dm755 "theme.sh" "$pkgdir/usr/bin/theme.sh"
}
