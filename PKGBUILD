# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=plog
pkgver=1.1.8
pkgrel=1
pkgdesc='Portable, simple and extensible C++ logging library'
arch=('any')
url='https://github.com/SergiusTheBest/plog'
license=('MPL2')
source=("https://github.com/SergiusTheBest/plog/archive/${pkgver}.zip")
sha256sums=('80cf2a2f49e9c0f17327c129d863bc320d7ac48a799d26ba585fd2123a76c404')

package() {
    cd "${srcdir}/plog-${pkgver}"
    mkdir -p "${pkgdir}/usr/include"
    cp -R include "${pkgdir}/usr"
}
