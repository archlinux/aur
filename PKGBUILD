# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=cppreference-doc
pkgver=20211127
pkgrel=1
pkgdesc='A complete reference for the features in the C++ Standard Library. HTML book, fork by PeterFeicht'
arch=('any')
url='http://en.cppreference.com/'
license=(CCPL:cc-by-sa GPL3)
options=('!strip' '!emptydirs')
provides=(cppreference)
conflicts=(cppreference)
source=("https://github.com/PeterFeicht/$pkgname/releases/download/v$pkgver/html-book-$pkgver.tar.xz")
sha256sums=('80e8d45aca1739b1681e28c88d274c7342fc5940b3e6343cedec82796f3e41e1')

package() {
	mkdir        -p "$pkgdir"/usr/share/doc/cppreference
	mv reference -T "$pkgdir"/usr/share/doc/cppreference
}
