# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=plog
pkgver=1.1.5
pkgrel=1
pkgdesc='Portable, simple and extensible C++ logging library'
arch=('any')
url='https://github.com/SergiusTheBest/plog'
license=('MPL2')
source=("https://github.com/SergiusTheBest/plog/archive/${pkgver}.zip")
sha256sums=('2e16efba6b4d94a77f5c0c1ca8624d707c80ca7dfe3c49c89662e1540febb448')

package() {
    cd "${srcdir}/plog-${pkgver}"
    mkdir -p "${pkgdir}/usr/include"
    cp -R include "${pkgdir}/usr"
}
