# Maintainer: -=De/\/=-
# Author: Ezequiel
# Contributor: Ezequiel
pkgname=cadzinho
pkgver=0.4.0
pkgrel=1
pkgdesc="Minimalist computer aided design (CAD) software"
arch=('x86_64')
url='https://github.com/zecruel/CadZinho'
license=('MIT')

depends=('sdl2' 'lua')

source=('https://github.com/zecruel/CadZinho/releases/download/0.4.0/linux.zip')

package() {
    cd ${srcdir}
    install -dm755 ${pkgdir}/usr/share/{cadzinho,applications,icons}
    cp -r ${srcdir}/share/* ${pkgdir}/usr/share
    install -D -m755 ${srcdir}/cadzinho ${pkgdir}/usr/bin/cadzinho
}
sha256sums=('651708ee3bdcbe39f4dc06a412577a81d898079364dcb2b842da153959620f43')
