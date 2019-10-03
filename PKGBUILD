# SPDX-License-Identifier: GPL-3.0-or-later
# Contributor: Elias Yuan <cecilelias.yuan@gmail.com>
pkgname=('neon-knights-icons-blue' 'neon-knights-icons-green' 'neon-knights-icons-orange' 'neon-knights-icons-red' 'neon-knights-icons-violet' 'neon-knights-icons-yellow')
_theme=('Neon-Knights-Blue-Folders' 'Neon-Knights-Green-Folders' 'Neon-Knights-Orange-Folders' 'Neon-Knights-Red-Folders' 'Neon-Knights-Violet-Folders' 'Neon-Knights-Yellow-Folders')
_de="icons"
pkgbase='neon-knights-icons'
pkgver=20190905
pkgrel=1
pkgdesc="Bright and colorful folders icons. Not a complete icon set."
arch=('any')
url="https://www.opencode.net/ju1464/Neon_Knights_Themes"
license=('GPL3')
groups=('neon-knights-themes')
_src="Neon_Knights_Themes-master"
source=("${url}/-/archive/master/${_src}.tar.bz2")
sha256sums=('b81ad32d031e32a09760f6667ecf02a95a124bb2b04e1237462a26f987fb37d8')
md5sums=('46fab31e31af5c41342ac8b3b119c51d')
_dest="/usr/share/icons"

package_neon-knights-icons-blue() {
    pkgdesc="Bright blue folders icons. Not a complete icon set."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[0]} "$pkgdir"$_dest/${_theme[0]}_icons
}

package_neon-knights-icons-green() {
    pkgdesc="Bright green folders icons. Not a complete icon set."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[1]} "$pkgdir"$_dest/${_theme[1]}_icons
}

package_neon-knights-icons-orange() {
    pkgdesc="Bright orange folders icons. Not a complete icon set."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[2]} "$pkgdir"$_dest/${_theme[2]}_icons
}

package_neon-knights-icons-red() {
    pkgdesc="Bright red folders icons. Not a complete icon set."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[3]} "$pkgdir"$_dest/${_theme[3]}_icons
}

package_neon-knights-icons-violet() {
    pkgdesc="Bright violet folders icons. Not a complete icon set."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

     cp -r "$srcdir"/${_src}/${_de}/${_theme[4]} "$pkgdir"$_dest/${_theme[4]}_icons
}

package_neon-knights-icons-yellow() {
    pkgdesc="Bright yellow folders icons. Not a complete icon set."

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp -r "$srcdir"/${_src}/${_de}/${_theme[5]} "$pkgdir"$_dest/${_theme[5]}_icons
}
