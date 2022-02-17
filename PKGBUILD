# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=cppreference-doc
pkgver=20220201
pkgrel=1
pkgdesc='A complete reference for the features in the C++ Standard Library. HTML book, fork by PeterFeicht'
arch=('any')
url='http://en.cppreference.com/'
license=(CCPL:cc-by-sa GPL3)
options=('!strip' '!emptydirs')
provides=(cppreference)
conflicts=(cppreference)
source=("https://github.com/PeterFeicht/$pkgname/releases/download/v$pkgver/html-book-$pkgver.tar.xz")
sha256sums=('b41960e7ec9c5433b31b1b33db5854f97770ae49535c81e7647f618003102d1a')

package() {
	mkdir        -p "$pkgdir"/usr/share/doc/cppreference
	mv reference -T "$pkgdir"/usr/share/doc/cppreference
}
