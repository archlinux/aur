# Maintainer: mibbio <contact at mibbiodev dot de>

pkgname=cinnamon-theme-ciliora-tertia
pkgver=20150429
pkgrel=1
pkgdesc="Ciliora-Tertia theme for Cinnamon 2.4"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/426"
license=('GPL')
depends=('cinnamon>=2.4.0' 'cinnamon<2.5.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/E386-PDZ1-51GY.zip")
sha256sums=('1b1c0b9a5674faa3b01b2975dc85d4723a8c93f27007edc0f8b03ea45605fabd')

package() {
  find Ciliora-Tertia -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
