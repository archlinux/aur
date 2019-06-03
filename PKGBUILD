# Maintainer: Alireza Ayinmehr <alireza.darksun@gmail.com>

pkgname=xfwm4-theme-dots-git
pkgver=9dae772
pkgrel=2
pkgdesc="A xfwm4 theme for xfce"
arch=('any')
url="https://github.com/rafacuevas3/dots-theme"
license=()
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver () {
    cd "${srcdir}/${pkgname}/"
    git describe --always
}

package() {
    cd "${srcdir}/${pkgname}/"
    install -dm755 "${pkgdir}/usr/share/themes"
    cp -a ./Dots*/ "${pkgdir}/usr/share/themes/"
}
