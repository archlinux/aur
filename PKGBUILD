# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tela-icon-theme
_pkgver=2022-08-28
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A flat colorful design icon theme."
arch=('any')
url="https://www.pling.com/p/1279924"
license=('GPL3')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
options=('!strip')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/vinceliuice/Tela-icon-theme/archive/$_pkgver.tar.gz")
sha256sums=('09be82313a0ccfab4e3390de6dd1bd0ace115ba5990aae42e327777642ee7ff4')

package() {
  cd "Tela-icon-theme-$_pkgver"
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -a -d "$pkgdir/usr/share/icons"
}
