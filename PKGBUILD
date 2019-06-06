# Maintainer: Juan Simón <play4pro@protonmail.com>

pkgname=drill-search-cli-bin
pkgver=1.209
pkgrel=1
pkgdesc="Search files without indexing, but clever crawling (CLI version)"
url="https://www.drill.santamorena.me/"
arch=('x86_64')
license=('GPL2')
provides=("${pkgname}")
conflicts=("${provides[@]}")
source=("https://github.com/yatima1460/Drill/releases/download/$pkgver/Drill-cli-linux-$pkgver-x86_64.deb")
md5sums=('a21bbf7a866104ab93c36b50fdd8154a')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"/
	chmod -R 755 "$pkgdir"/opt "$pkgdir"/usr
}

