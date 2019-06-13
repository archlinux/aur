# Maintainer: Juan Simón <play4pro@protonmail.com>

pkgname=drill-search-gtk-bin
pkgver=1.237
pkgrel=2
pkgdesc="Search files without indexing, but clever crawling (GTK version)"
url="https://www.drill.santamorena.me/"
arch=('x86_64')
license=('GPL2')
depends=('gtk3')
provides=('drill-search-gtk')
source=("https://github.com/yatima1460/Drill/releases/download/$pkgver/Drill-GTK-linux-x86_64-release-$pkgver.deb")

md5sums=('e1bbc0538d27961b72bf6e11e06bc596')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"/
	chmod -R 755 "$pkgdir"/opt "$pkgdir"/usr
}

