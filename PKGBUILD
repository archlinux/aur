# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tela-icon-theme
_pkgver=2021-10-08
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A flat colorful design icon theme."
arch=('any')
url="https://www.pling.com/p/1279924"
license=('GPL3')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
options=('!strip')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/vinceliuice/Tela-icon-theme/archive/$_pkgver.tar.gz")
sha256sums=('3779317c8114ce9140971bda3383ff88283776bb10107f879d5b0c29b085fe81')

package() {
  cd "Tela-icon-theme-$_pkgver"
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -a -d "$pkgdir/usr/share/icons"
}
