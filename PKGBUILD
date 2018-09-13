# Maintainer: Scott Dickson <scottfoesho@gmail.com>

pkgname=gnome-shell-extension-gnomenu
pkgver=28
pkgrel=1
pkgdesc="GnoMenu - is a traditional styled full featured Gnome-Shell apps-menu, that aims to offer all the essentials in a simple uncluttered intuitive interface."
arch=('any')
url="https://github.com/The-Panacea-Projects/Gnomenu"
license=('GPL3')
depends=('gnome-shell')
source=("https://github.com/The-Panacea-Projects/Gnomenu/archive/gno-menu.v${pkgver}.tar.gz")
sha256sums=('0eb70c747be17a0256bd08d91241901c978f67d041d7fdd741d1e93cbfca4233')

package() {
  _extname='gnomenu@panacier.gmail.com'

  cd "${srcdir}/Gnomenu-gno-menu.v${pkgver}"
  rm README.md Screenshot.png

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_extname}"
  cp -r . "$pkgdir/usr/share/gnome-shell/extensions/${_extname}/"
}
