# Maintainer: -=De/\/=-
# Author: Ezequiel
# Contributor: Ezequiel
pkgname=cadzinho
pkgver=0.3.0
pkgrel=1
pkgdesc="Minimalist computer aided design (CAD) software"
arch=('x86_64')
url='https://github.com/zecruel/CadZinho'
license=('MIT')

depends=('sdl2' 'lua')

source=('https://github.com/zecruel/CadZinho/releases/download/0.3.0/linux.zip')

package() {
    cd ${srcdir}
    install -dm755 ${pkgdir}/usr/share/{cadzinho,applications,icons}
    cp -r ${srcdir}/share/* ${pkgdir}/usr/share
    install -D -m755 ${srcdir}/cadzinho ${pkgdir}/usr/bin/cadzinho
}
sha256sums=('0f7ca0c3958950ce18340a210bfa04c4ec2e7256f9bdceb2864f7291a464b08a')
