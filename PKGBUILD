# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=numix-cinnamon-dark
pkgver=4.6.7
pkgrel=1
pkgdesc="A darker-themed fork of zagortenay333/numix-cinnamon"
arch=('any')
url='https://github.com/ion201/numix-cinnamon-dark'
license=('AGPL3')
depends=()
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ion201/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('a9c97033a0c664b9e28e9e71211d2a66')

package() {
    mkdir -p "${pkgdir}/usr/share/themes"
    cp -r "${srcdir}/${pkgname}-${pkgver}/Numix-Cinnamon-Dark" "${pkgdir}/usr/share/themes"
}
