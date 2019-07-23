# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=mint-x-icons
pkgver=1.5.2
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
sha256sums=('ed68acda84379483338d3c4f374ae5f2295d4dd7f6560aa2cc102d7cc2460e50')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
