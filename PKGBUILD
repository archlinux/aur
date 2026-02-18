pkgname=macup
pkgver=1.0.0
pkgrel=1
pkgdesc="A very light command-line tool for matching MAC prefixes to vendors (and some other stuff)"
arch=('any')
license=('GPL3')
url="https://github.com/3xiondev/macup"
source=("https://github.com/3xionDev/macup/raw/refs/heads/main/macup-1.0.0.tar.gz")
sha256sums=('SKIP')

package() {
	depends=('jq>=1.8.1' 'wget>=1.25.0')

	install -D -t "$pkgdir/usr/bin" "$srcdir/macup-$pkgver/macup"

	chmod +x "$pkgdir/usr/bin/macup"
}
