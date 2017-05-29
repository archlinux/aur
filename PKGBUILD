# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-settings'
pkgver=1.0.8
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager "
arch=('any')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL3')
depends=(hicolor-icon-theme lightdm lightdm-slick-greeter lsb-release python-setproctitle python-xapp)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('e71f9c89e4b59279c414e2969ab1613692289672db10aabf875f12039d7dd4b6')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r usr $pkgdir
}
