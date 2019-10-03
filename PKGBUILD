# SPDX-License-Identifier: GPL-3.0-or-later
# Contributor: Elias Yuan <cecilelias.yuan@gmail.com>
pkgname=('neon-knights-tint2-blue' 'neon-knights-tint2-green' 'neon-knights-tint2-orange' 'neon-knights-tint2-red' 'neon-knights-tint2-violet' 'neon-knights-tint2-yellow')
_theme=('NeonKnightsBlue' 'NeonKnightsGreen' 'NeonKnightsOrange' 'NeonKnightsRed' 'NeonKnightsViolet' 'NeonKnightsYellow')
_de="Tint2"
pkgbase='neon-knights-tint2'
pkgver=0.9
pkgrel=1
pkgdesc="Tint2rc templates with vivid colors."
arch=('any')
url="https://www.opencode.net/ju1464/Neon_Knights_Themes"
license=('GPL3')
groups=('neon-knights-themes')
optdepends=('xfce4-appfinder' 'volumeicon')
_src="Neon_Knights_Themes-master"
source=("${url}/-/archive/master/${_src}.tar.bz2")
sha256sums=('b81ad32d031e32a09760f6667ecf02a95a124bb2b04e1237462a26f987fb37d8')
md5sums=('46fab31e31af5c41342ac8b3b119c51d')
_dest="/etc"

package_neon-knights-tint2-blue() {
    pkgdesc="Template at /etc/${pkgname[0]}/${_theme[0]}.tint2rc"

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp "$srcdir"/${_src}/${_de}/icons/power.svg "$pkgdir"${_dest}/${pkgname[0]}/icons/
    cp "$srcdir"/${_src}/${_de}/${_theme[0]}.tint2rc "$pkgdir"${_dest}/${pkgname[0]}/
}

package_neon-knights-tint2-green() {
    pkgdesc="Template at /etc/${pkgname[1]}/${_theme[1]}.tint2rc"

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp "$srcdir"/${_src}/${_de}/icons/power.svg "$pkgdir"${_dest}/${pkgname[1]}/icons/
    cp "$srcdir"/${_src}/${_de}/${_theme[1]}.tint2rc "$pkgdir"${_dest}/${pkgname[1]}/
}

package_neon-knights-tint2-orange() {
    pkgdesc="Template at /etc/${pkgname[2]}/${_theme[2]}.tint2rc"

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp "$srcdir"/${_src}/${_de}/icons/power.svg "$pkgdir"${_dest}/${pkgname[2]}/icons/
    cp "$srcdir"/${_src}/${_de}/${_theme[2]}.tint2rc "$pkgdir"${_dest}/${pkgname[2]}/
}

package_neon-knights-tint2-red() {
    pkgdesc="Template at /etc/${pkgname[3]}/${_theme[3]}.tint2rc"

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp "$srcdir"/${_src}/${_de}/icons/power.svg "$pkgdir"${_dest}/${pkgname[3]}/icons/
    cp "$srcdir"/${_src}/${_de}/${_theme[3]}.tint2rc "$pkgdir"${_dest}/${pkgname[3]}/
}

package_neon-knights-tint2-violet() {
    pkgdesc="Template at /etc/${pkgname[4]}/${_theme[4]}.tint2rc"

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp "$srcdir"/${_src}/${_de}/icons/power.svg "$pkgdir"${_dest}/${pkgname[4]}/icons/
     cp "$srcdir"/${_src}/${_de}/${_theme[4]}.tint2rc "$pkgdir"${_dest}/${pkgname[4]}/
}

package_neon-knights-tint2-yellow() {
     pkgdesc="Template at /etc/${pkgname[5]}/${_theme[5]}.tint2rc"

    if [ ! -d "$pkgdir"$_dest ]; then
        install -d "$pkgdir"$_dest
    fi

    cp "$srcdir"/${_src}/${_de}/icons/power.svg "$pkgdir"${_dest}/${pkgname[5]}/icons/
    cp "$srcdir"/${_src}/${_de}/${_theme[5]}.tint2rc "$pkgdir"${_dest}/${pkgname[5]}/
}
