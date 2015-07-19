pkgname=fortune-mod-vimtips
pkgver=201510719
pkgrel=3
pkgdesc="Vim fortune cookies"
url="https://github.com/hobbestigrou/vimtips-fortune"
arch=(any)
license=(unknown)
depends=(fortune-mod)
source=('https://raw.githubusercontent.com/hobbestigrou/vimtips-fortune/master/fortunes/vimtips')
md5sums=(SKIP)

build() {
    cd ${srcdir}
    strfile -r vimtips
}

package(){
    mkdir -p ${pkgdir}/usr/share/fortune
    cp ${srcdir}/vimtips ${pkgdir}/usr/share/fortune
    cp ${srcdir}/vimtips.dat ${pkgdir}/usr/share/fortune
}