pkgname=span
pkgver=1.0.0
pkgrel=1
pkgdesc="real-time noninteractive top-alternative system monitor panel for linux written in python"
arch=('any')
license=('GPL3')
url="https://github.com/3xiondev/span"
source=("https://github.com/3xionDev/span/releases/download/1.0.0/span-1.0.0.tar.gz")
sha256sums=('SKIP')

package() {
	depends=('lm_sensors')

	install -D -t "$pkgdir/usr/bin" "$srcdir/span-$pkgver/span"

	chmod +x "$pkgdir/usr/bin/span"
}
