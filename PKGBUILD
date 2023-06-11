# Maintainer: Dane Hobrecht <76x5l22l@anonaddy.me>

pkgname=shadowtube
pkgver=1.0.2
pkgrel=1
pkgdesc="A YouTube shadowban detection program."
arch=('any')
url="https://github.com/danehobrecht/shadowtube"
license=('GPL')

source=("https://github.com/danehobrecht/shadowtube/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('78a5bfbfe2eb47827db8c5cd8c63ae2f7f95f57dbff06d6b83f33a94d970168b')

package() {
	cd "$srcdir"
	install -Dm755 main.py "$pkgdir/usr/bin/shadowtube"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 settings.json "$pkgdir/etc/shadowtube/settings.json"
}