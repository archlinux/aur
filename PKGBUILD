# Maintainer: Juan Simón <play4pro@protonmail.com>

pkgname=drill-search-cli-bin
pkgver=1.230
pkgrel=1
pkgdesc="Search files without indexing, but clever crawling (CLI version)"
url="https://www.drill.santamorena.me/"
arch=('x86_64')
license=('GPL2')
provides=("${pkgname}")
conflicts=("${provides[@]}")
source=("https://github.com/yatima1460/Drill/releases/download/$pkgver/Drill-CLI-linux-x86_64-release-$pkgver.deb")
md5sums=('e8d853b674272dd07aa4235326c40bac')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"/
	chmod -R 755 "$pkgdir"/opt "$pkgdir"/usr
}


