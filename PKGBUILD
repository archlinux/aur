# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Scott Dickson <scottfoesho@gmail.com>

pkgname=gnome-shell-extension-gnomenu
pkgver=29
pkgrel=1
pkgdesc="GnoMenu - is a traditional styled full featured Gnome-Shell apps-menu, that aims to offer all the essentials in a simple uncluttered intuitive interface."
arch=('any')
url="https://github.com/The-Panacea-Projects/Gnomenu"
license=('GPL3')
depends=('gnome-shell')
source=("https://github.com/The-Panacea-Projects/Gnomenu/archive/gno-menu.v${pkgver}.tar.gz")
sha256sums=('48716da48902f272da6e2a81472ea7ce0e3a9b299c087daaab39ba313ff9362e')

package() {
  _extname='gnomenu@panacier.gmail.com'

  cd "${srcdir}/Gnomenu-gno-menu.v${pkgver}"
  rm README.md Screenshot.png

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_extname}"
  cp -r . "$pkgdir/usr/share/gnome-shell/extensions/${_extname}/"
}
