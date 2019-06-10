# Maintainer: Juan Simón <play4pro@protonmail.com>

pkgname=drill-search-cli-bin
pkgver=1.213
pkgrel=1
pkgdesc="Search files without indexing, but clever crawling (CLI version)"
url="https://www.drill.santamorena.me/"
arch=('x86_64')
license=('GPL2')
provides=("${pkgname}")
conflicts=("${provides[@]}")
source=("https://github.com/yatima1460/Drill/releases/download/$pkgver/Drill-cli-linux-$pkgver-x86_64.deb")
md5sums=('d2a56d360b90958b69d467884938a0d1')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"/
	chmod -R 755 "$pkgdir"/opt "$pkgdir"/usr
}


