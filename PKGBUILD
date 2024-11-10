# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=cppreference-doc
pkgver=20241110
pkgrel=1
pkgdesc='A complete reference for the features in the C++ Standard Library. HTML book, fork by PeterFeicht'
arch=('any')
url='http://en.cppreference.com/'
license=(CC-BY-SA-3.0 GPL-3.0-only)
options=('!strip' '!emptydirs' '!debug')
provides=(cppreference)
conflicts=(cppreference)
source=("https://github.com/PeterFeicht/$pkgname/releases/download/v$pkgver/html-book-$pkgver.tar.xz")
sha256sums=('431e80862eb70fd4793a60d7d3b6c13c8605284978f9ea0529572e8fd1562cc6')

package() {
	mkdir        -p "$pkgdir"/usr/share/doc/cppreference
	mv reference -T "$pkgdir"/usr/share/doc/cppreference
}
