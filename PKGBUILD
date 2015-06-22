# Maintainer: mibbio <contact at mibbiodev dot de>

pkgname=cinnamon-theme-ciliora-prima
pkgver=20150429
pkgrel=1
pkgdesc="Ciliora-Prima theme for Cinnamon 2.4"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/323"
license=('GPL')
depends=('cinnamon>=2.4.0' 'cinnamon<2.5.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/C6VL-U4BT-OA67.zip")
sha256sums=('bf39718947e71f13743137804516fb5574d07de4b6b14947d456880c92db2405')

package() {
  find Ciliora-Prima -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
