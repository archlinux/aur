# Maintainer: FireZ <firez199984@gmail.com>

pkgname=vim-arduino-syntax-git
_pkgname=vim-arduino-syntax
pkgver=83f766d
pkgrel=1
arch=(any)
depends=(vim)
source=("git://github.com/sudar/vim-arduino-syntax.git")
md5sums=(SKIP)

package() {
    cd "${srcdir}/${_pkgname}"
    for dir in ftdetect indent syntax
    do
        install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles/${dir}
        install -D -m 644 ${dir}/* ${pkgdir}/usr/share/vim/vimfiles/${dir}
    done
}
