# Maintainer: Juan Simón <play4pro@protonmail.com>

pkgname=drill-search-bin
pkgver=1.204
pkgrel=2
pkgdesc="Search files without indexing, but clever crawling"
url="https://www.drill.santamorena.me/"
arch=('x86_64')
license=('GPL2')
depends=('gtk3')
provides=("${pkgname}")
conflicts=("${provides[@]}")
source=("https://github.com/yatima1460/Drill/releases/download/$pkgver/Drill-ui-linux-$pkgver-x86_64.deb")
md5sums=('2145bea81d4ceb0f6637644c9348ad8f')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"/
	chmod -R 755 "$pkgdir"/opt "$pkgdir"/usr
}

