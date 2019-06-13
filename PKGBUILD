# Maintainer: Juan Simón <play4pro@protonmail.com>

pkgname=drill-search-cli-bin
pkgver=1.237
pkgrel=1
pkgdesc="Search files without indexing, but clever crawling (CLI version)"
url="https://www.drill.santamorena.me/"
arch=('x86_64')
license=('GPL2')
provides=("${pkgname}")
conflicts=('drill-search-cli')
source=("https://github.com/yatima1460/Drill/releases/download/$pkgver/Drill-CLI-linux-x86_64-release-$pkgver.deb")
md5sums=('f79a50c899cf8044466f5e724f431fdd')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"/
	chmod -R 755 "$pkgdir"/opt "$pkgdir"/usr
}
