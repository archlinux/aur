# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=plog
pkgver=1.1.4
pkgrel=1
pkgdesc='Portable, simple and extensible C++ logging library'
arch=('any')
url='https://github.com/SergiusTheBest/plog'
license=('MPL2')
source=("https://github.com/SergiusTheBest/plog/archive/${pkgver}.zip")
sha256sums=('88192dc952bed83d81d5d4b56b3a22b3de0699e7c15a7b47f1c60631ec34d69e')

package() {
    cd "${srcdir}/plog-${pkgver}"
    mkdir -p "${pkgdir}/usr/include"
    cp -R include "${pkgdir}/usr"
}
