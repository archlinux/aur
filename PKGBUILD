# Maintainer: mibbio <contact at mibbiodev dot de>

pkgname=cinnamon-theme-ciliora-secunda
pkgver=20150624
pkgrel=1
pkgdesc="Ciliora-Secunda theme for Cinnamon 2.6"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/411"
license=('GPL')
depends=('cinnamon>=2.6.0' 'cinnamon<2.7.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/DKC0-D6WT-MA4P.zip")
sha256sums=('680b05a40fe83bc6e70cefcc01d107e23f4e0d3e5ce0c0dcdc94edd985d651e6')

package() {
  find Ciliora-Secunda -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
