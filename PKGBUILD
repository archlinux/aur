# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tela-icon-theme
_pkgver=2021-12-25
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A flat colorful design icon theme."
arch=('any')
url="https://www.pling.com/p/1279924"
license=('GPL3')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
options=('!strip')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/vinceliuice/Tela-icon-theme/archive/$_pkgver.tar.gz")
sha256sums=('c627ec4265a2a907ef5cefbd38f8bee2a229446fc07b7245cbbe8749e8b64169')

package() {
  cd "Tela-icon-theme-$_pkgver"
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -a -d "$pkgdir/usr/share/icons"
}
