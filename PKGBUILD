# Maintainer: Louise <louise dot aur at mailbox dot org>

pkgname=lyra
pkgver=1.6
pkgdesc="A simple to use, composable, command line parser for C++ 11 and beyond"
pkgrel=1
arch=('any')
source=("https://github.com/bfgroup/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("919e92a9c02fea3f365a3a7bdccd8b306311a28a7f2044dac8e7651106d7b644")
makedpends=('cmake')

build() {
    cd Lyra-${pkgver}
    cmake .
}

package() {
    cd Lyra-${pkgver}
    make DESTDIR="${pkgdir}" install
}
