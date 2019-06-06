# Maintainer: Juan Simón <play4pro@protonmail.com>

pkgname=drill-search-bin
pkgver=1.209
pkgrel=1
pkgdesc="Search files without indexing, but clever crawling"
url="https://www.drill.santamorena.me/"
arch=('x86_64')
license=('GPL2')
depends=('gtk3')
provides=("${pkgname}")
conflicts=("${provides[@]}")
source=("https://github.com/yatima1460/Drill/releases/download/$pkgver/Drill-ui-linux-$pkgver-x86_64.deb")
md5sums=('819843cf4d3192c0832dde417d27547c')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"/
	chmod -R 755 "$pkgdir"/opt "$pkgdir"/usr
}
