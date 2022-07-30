# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=cppreference-doc
pkgver=20220730
pkgrel=1
pkgdesc='A complete reference for the features in the C++ Standard Library. HTML book, fork by PeterFeicht'
arch=('any')
url='http://en.cppreference.com/'
license=(CCPL:cc-by-sa GPL3)
options=('!strip' '!emptydirs')
provides=(cppreference)
conflicts=(cppreference)
source=("https://github.com/PeterFeicht/$pkgname/releases/download/v$pkgver/html-book-$pkgver.tar.xz")
sha256sums=('71f15003c168b8dc5a00cbaf19b6480a9b3e87ab7e462aa39edb63d7511c028b')

package() {
	mkdir        -p "$pkgdir"/usr/share/doc/cppreference
	mv reference -T "$pkgdir"/usr/share/doc/cppreference
}
