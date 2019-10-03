# SPDX-License-Identifier: GPL-3.0-or-later
# Contributor: Elias Yuan <cecilelias.yuan@gmail.com>
pkgname=('neon-knights-cinnamon-blue' 'neon-knights-cinnamon-green' 'neon-knights-cinnamon-orange' 'neon-knights-cinnamon-red' 'neon-knights-cinnamon-violet' 'neon-knights-cinnamon-yellow')
_theme=('Neon_Knights_Blue_Cinnamon' 'Neon_Knights_Green_Cinnamon' 'Neon_Knights_Orange_Cinnamon' 'Neon_Knights_Red_Cinnamon' 'Neon_Knights_Violet_Cinnamon' 'Neon_Knights_Yellow_Cinnamon')
_de="Cinnamon"
pkgbase='neon-knights-cinnamon'
pkgver=0.2
pkgrel=1
pkgdesc="Dark Cinnamon themes with vivid colors."
arch=('any')
url="https://www.opencode.net/ju1464/Neon_Knights_Themes"
license=('GPL3')
groups=('neon-knights-themes')
_src="Neon_Knights_Themes-master"
source=("${url}/-/archive/master/${_src}.tar.bz2")
sha256sums=('b81ad32d031e32a09760f6667ecf02a95a124bb2b04e1237462a26f987fb37d8')
md5sums=('46fab31e31af5c41342ac8b3b119c51d')
_dest="/usr/share/themes"

package_neon-knights-cinnamon-blue() {
    pkgdesc="Dark Cinnamon theme with vivid blue accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[0]} "$pkgdir"$_dest
}

package_neon-knights-cinnamon-green() {
    pkgdesc="Dark Cinnamon theme with vivid green accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[1]} "$pkgdir"$_dest
}

package_neon-knights-cinnamon-orange() {
    pkgdesc="Dark Cinnamon theme with vivid orange accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[2]} "$pkgdir"$_dest
}

package_neon-knights-cinnamon-red() {
    pkgdesc="Dark Cinnamon theme with vivid red accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[3]} "$pkgdir"$_dest
}

package_neon-knights-cinnamon-violet() {
    pkgdesc="Dark Cinnamon theme with vivid violet accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

     cp -r "$srcdir"/${_src}/${_de}/${_theme[4]} "$pkgdir"$_dest
}

package_neon-knights-cinnamon-yellow() {
    pkgdesc="Dark Cinnamon theme with vivid yellow accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[5]} "$pkgdir"$_dest
}
