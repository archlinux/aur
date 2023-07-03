# SPDX-License-Identifier: GPL-3.0-or-later
# Contributor: Elias Elwyn <a@jthv.ai>
pkgname=('neon-knights-openbox-blue' 'neon-knights-openbox-green' 'neon-knights-openbox-orange' 'neon-knights-openbox-red' 'neon-knights-openbox-violet' 'neon-knights-openbox-yellow')
_theme=('Neon_Knights_Blue_Ob' 'Neon_Knights_Green_Ob' 'Neon_Knights_Orange_Ob' 'Neon_Knights_Red_Ob' 'Neon_Knights_Violet_Ob' 'Neon_Knights_Yellow_Ob')
_de="Openbox"
pkgbase='neon-knights-openbox'
pkgver=1.1
pkgrel=1
pkgdesc="Dark Openbox themes with vivid colors."
arch=('any')
url="https://www.opencode.net/ju1464/Neon_Knights_Themes"
license=('GPL3')
groups=('neon-knights-themes')
_src="Neon_Knights_Themes-master"
source=("${url}/-/archive/master/${_src}.tar.bz2")
sha256sums=('b81ad32d031e32a09760f6667ecf02a95a124bb2b04e1237462a26f987fb37d8')
md5sums=('46fab31e31af5c41342ac8b3b119c51d')
_dest="/usr/share/themes"

package_neon-knights-openbox-blue() {
    pkgdesc="Dark Openbox theme with vivid blue accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[0]} "$pkgdir"$_dest
}

package_neon-knights-openbox-green() {
    pkgdesc="Dark Openbox theme with vivid green accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[1]} "$pkgdir"$_dest
}

package_neon-knights-openbox-orange() {
    pkgdesc="Dark Openbox theme with vivid orange accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[2]} "$pkgdir"$_dest
}

package_neon-knights-openbox-red() {
    pkgdesc="Dark Openbox theme with vivid red accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[3]} "$pkgdir"$_dest
}

package_neon-knights-openbox-violet() {
    pkgdesc="Dark Openbox theme with vivid violet accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

     cp -r "$srcdir"/${_src}/${_de}/${_theme[4]} "$pkgdir"$_dest
}

package_neon-knights-openbox-yellow() {
    pkgdesc="Dark Openbox theme with vivid yellow accents."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[5]} "$pkgdir"$_dest
}
