# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=plog
pkgver=1.1.6
pkgrel=1
pkgdesc='Portable, simple and extensible C++ logging library'
arch=('any')
url='https://github.com/SergiusTheBest/plog'
license=('MPL2')
source=("https://github.com/SergiusTheBest/plog/archive/${pkgver}.zip")
sha256sums=('d9499c61befcb19e334a8ec6851b21f8ccd5d3ae7e43a3cba996bf6b71016d27')

package() {
    cd "${srcdir}/plog-${pkgver}"
    mkdir -p "${pkgdir}/usr/include"
    cp -R include "${pkgdir}/usr"
}
