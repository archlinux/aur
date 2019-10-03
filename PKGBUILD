# SPDX-License-Identifier: GPL-3.0-or-later
# Contributor: Elias Yuan <cecilelias.yuan@gmail.com>
pkgname=('neon-knights-xfwm4-blue' 'neon-knights-xfwm4-green' 'neon-knights-xfwm4-orange' 'neon-knights-xfwm4-red' 'neon-knights-xfwm4-violet' 'neon-knights-xfwm4-yellow')
_theme=('Neon_Knights_Blue' 'Neon_Knights_Green' 'Neon_Knights_Orange' 'Neon_Knights_Red' 'Neon_Knights_Violet' 'Neon_Knights_Yellow')
_de="Xfwm4"
pkgbase='neon-knights-xfwm4'
pkgver=0.1
pkgrel=1
pkgdesc="Dark Xfwm4 themes with vivid colors."
arch=('any')
url="https://www.opencode.net/ju1464/Neon_Knights_Themes"
license=('GPL3')
groups=('neon-knights-themes')
_src="Neon_Knights_Themes-master"
source=("${url}/-/archive/master/${_src}.tar.bz2")
sha256sums=('b81ad32d031e32a09760f6667ecf02a95a124bb2b04e1237462a26f987fb37d8')
md5sums=('46fab31e31af5c41342ac8b3b119c51d')
_dest="/usr/share/themes"

package_neon-knights-xfwm4-blue() {
    pkgdesc="Dark Xfwm4 theme with vivid blue accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[0]} "$pkgdir"$_dest/${_theme[0]}_Xfwm4
}

package_neon-knights-xfwm4-green() {
    pkgdesc="Dark Xfwm4 theme with vivid green accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[1]} "$pkgdir"$_dest/${_theme[1]}_Xfwm4
}

package_neon-knights-xfwm4-orange() {
    pkgdesc="Dark Xfwm4 theme with vivid orange accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[2]} "$pkgdir"$_dest/${_theme[2]}_Xfwm4
}

package_neon-knights-xfwm4-red() {
    pkgdesc="Dark Xfwm4 theme with vivid red accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[3]} "$pkgdir"$_dest/${_theme[3]}_Xfwm4
}

package_neon-knights-xfwm4-violet() {
    pkgdesc="Dark Xfwm4 theme with vivid violet accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

     cp -r "$srcdir"/${_src}/${_de}/${_theme[4]} "$pkgdir"$_dest/${_theme[4]}_Xfwm4
}

package_neon-knights-xfwm4-yellow() {
    pkgdesc="Dark Xfwm4 theme with vivid yellow accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[5]} "$pkgdir"$_dest/${_theme[5]}_Xfwm4
}
