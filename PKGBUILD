# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-x-icons
pkgver=1.5.9
pkgrel=1
pkgdesc='A mint/metal theme based on mintified versions of Clearlooks Revamp, Elementary and Faenza'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=(GPL3)
depends=(
    gdk-pixbuf2
    gtk-update-icon-cache
    hicolor-icon-theme
)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('c6bcfc77cb09b53ab0e111ab769d1d40a5a7b8251c08aba3e91d488ada5daf21')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
