# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=plog
pkgver=1.1.9
pkgrel=1
pkgdesc='Portable, simple and extensible C++ logging library'
arch=('any')
url='https://github.com/SergiusTheBest/plog'
license=('MIT')
source=("https://github.com/SergiusTheBest/plog/archive/${pkgver}.zip")
sha256sums=('42905ee0d0f5e29396f11670c0ca91a03c92779ed685cc8edb4ef086fd47bedd')

package() {
    cd "${srcdir}/plog-${pkgver}"
    mkdir -p "${pkgdir}/usr/include"
    cp -R include "${pkgdir}/usr"
}
