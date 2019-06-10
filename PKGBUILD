# Maintainer: Juan Simón <play4pro@protonmail.com>

pkgname=drill-search-gtk-bin
pkgver=1.213
pkgrel=1
pkgdesc="Search files without indexing, but clever crawling (GTK version)"
url="https://www.drill.santamorena.me/"
arch=('x86_64')
license=('GPL2')
depends=('gtk3')
provides=("${pkgname}")
conflicts=("${provides[@]}")
source=("https://github.com/yatima1460/Drill/releases/download/$pkgver/Drill-ui-linux-$pkgver-x86_64.deb")
md5sums=('85bbf83542504f95eb50d2f00bdc4418')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"/
	chmod -R 755 "$pkgdir"/opt "$pkgdir"/usr
}

