# Maintainer: Alexandre Magno <alexandre.mbm@gmail.com>
pkgname=tfe
pkgver=0.2.0
pkgrel=1
_srcauthor=alexandre-mbm
pkgdesc="Tester of translation for Firexox's extension"
url="https://github.com/${_srcauthor}/${pkgname}"
arch=(any)
license=('MIT')
depends=('firefox' 'bash' 'coreutils' 'p7zip')
source=("https://github.com/${_srcauthor}/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('5d453340b6c193e86231108c0ab1454e')

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}

