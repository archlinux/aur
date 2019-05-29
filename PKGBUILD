# Maintainer: Juan Simón <play4pro@protonmail.com>

pkgname=drill-search
pkgver=1.199
pkgrel=1
pkgdesc="Search files without indexing, but clever crawling"
url="https://www.drill.santamorena.me/"
arch=('x86_64')
license=('GPL2')
provides=("${pkgname}")
conflicts=("${provides[@]}")
source=("https://github.com/yatima1460/Drill/releases/download/1.199/Drill-ui-linux-1.199-x86_64.deb")
md5sums=('6d7befe042e4553880bef3b3308bea11')                  

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"/
	chmod -R 755 "$pkgdir"/opt "$pkgdir"/usr
}
