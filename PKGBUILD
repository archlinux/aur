# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=numix-cinnamon-dark
pkgver=3.8.0
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
md5sums=('aa2d26f52975d6c8eec18eeb45197766')

package() {
    mkdir -p "${pkgdir}/usr/share/themes"
    cp -r "${srcdir}/${pkgname}-${pkgver}/Numix-Cinnamon-Dark" "${pkgdir}/usr/share/themes"
}
