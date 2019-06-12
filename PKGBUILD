# Maintainer: Juan Simón <play4pro@protonmail.com>

pkgname=drill-search-gtk-bin
pkgver=1.230
pkgrel=0
pkgdesc="Search files without indexing, but clever crawling (GTK version)"
url="https://www.drill.santamorena.me/"
arch=('x86_64')
license=('GPL2')
depends=('gtk3')
provides=("${pkgname}")
conflicts=("${provides[@]}")
source=("https://github.com/yatima1460/Drill/releases/download/$pkgver/Drill-GTK-linux-x86_64-release-$pkgver.deb")

md5sums=('79f380c37878322832fcb5d03099bd21')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"/
	chmod -R 755 "$pkgdir"/opt "$pkgdir"/usr
}

