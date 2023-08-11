# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=cppreference-doc
pkgver=20230810
pkgrel=1
pkgdesc='A complete reference for the features in the C++ Standard Library. HTML book, fork by PeterFeicht'
arch=('any')
url='http://en.cppreference.com/'
license=(CCPL:cc-by-sa GPL3)
options=('!strip' '!emptydirs')
provides=(cppreference)
conflicts=(cppreference)
source=("https://github.com/PeterFeicht/$pkgname/releases/download/v$pkgver/html-book-$pkgver.tar.xz")
sha256sums=('31c08e4d99e86c7f63f324d3ff5304eff2030131c4a0ac0d1e3c19c62c8ed684')

package() {
	mkdir        -p "$pkgdir"/usr/share/doc/cppreference
	mv reference -T "$pkgdir"/usr/share/doc/cppreference
}
