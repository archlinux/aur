# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=lightdm-settings
pkgver=1.2.9
pkgrel=1
pkgdesc='A configuration tool for the LightDM display manager'
arch=('any')
#url="https://github.com/linuxmint/${pkgname}"
url="http://packages.linuxmint.com/pool/main/l/${pkgname}"
license=(GPL3)
depends=(
    hicolor-icon-theme
    lightdm-slick-greeter
    polkit
    python-gobject
    python-setproctitle
    python-xapp
)
makedepends=(
    lightdm-slick-greeter
    desktop-file-utils
    gettext
)
#source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('c5ca61b2f563b4ed82fa1b4d63982b1d73d12498c1face7e909ea56d001e1ee4')

## Packaging via Github
#build() {
#  cd $pkgname-$pkgver
#  make
#}

#package() {
#  cd $pkgname-$pkgver
#  cp -r usr $pkgdir
#}

## Packaging via Linuxmint repository
build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  cp -r usr "$pkgdir"
}
