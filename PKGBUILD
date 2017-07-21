# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=numix-cinnamon-dark
pkgver=3.4.0
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
md5sums=('79cb4016a98eeb0af152e3300e26517b')

package() {
    mkdir -p "${pkgdir}/usr/share/themes"
    cp -r "${srcdir}/${pkgname}-${pkgver}/Numix-Cinnamon-Dark" "${pkgdir}/usr/share/themes"
}
