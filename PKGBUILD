# Maintainer: Tobias Borgert <tobias.borgertt@gmail.com>

pkgname=simpleini
pkgver=4.17
pkgrel=1
pkgdesc="Cross-platform C++ library providing a simple API to read and write INI-style configuration files"
arch=('any')
url="https://github.com/brofield/simpleini"
license=('MIT')
depends=()
makedepends=()
optdepends=()
source=(https://github.com/brofield/simpleini/archive/$pkgver.tar.gz)
sha256sums=('14e5bc1cb318ed374d45d6faf48da0b79db7e069c12ec6e090523b8652ef47c7')

package() {
	  install -D -m644 "${srcdir}"/"${pkgname}"-"${pkgver}"/SimpleIni.h "${pkgdir}"/usr/include/SimpleIni.h
	  install -D -m644 "${srcdir}"/"${pkgname}"-"${pkgver}"/ConvertUTF.h "${pkgdir}"/usr/include/ConvertUTF.h
	  install -D -m644 "${srcdir}"/"${pkgname}"-"${pkgver}"/ConvertUTF.c "${pkgdir}"/usr/include/ConvertUTF.c
}
