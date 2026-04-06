pkgname=67kid
pkgver=1.0
pkgrel=1
pkgdesc="刘夫妻小子正在和六七先闹矛盾🧠"
arch=("any")
license=("MIT")
source=("main.sh")
sha256sums=('SKIP')
package() {
  	mkdir -p "${pkgdir}/usr/bin"
	install -Dm755 ${srcdir}/main.sh "$pkgdir/usr/bin/67kid"
}
