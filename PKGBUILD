# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=libantlr3c-cpp-headers
pkgver=3.5.3
pkgrel=1
pkgdesc='C++ header files for libantlr3c'
arch=('any')
url='https://www.antlr.org/'
license=('BSD')
depends=('libantlr3c')

source=("https://github.com/antlr/antlr3/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a0892bcf164573d539b930e57a87ea45333141863a0dd3a49e5d8c919c8a58ab')

package() {
	mkdir "$pkgdir"/usr
	chmod 644 antlr3-$pkgver/runtime/Cpp/include/*
	mv antlr3-$pkgver/runtime/Cpp/include "$pkgdir"/usr
}
