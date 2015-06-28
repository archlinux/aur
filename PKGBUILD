# Maintainer: mibbio <contact at mibbiodev dot de>

pkgname=cinnamon-theme-ciliora-secunda
pkgver=20150624
pkgrel=2
pkgdesc="Ciliora-Secunda theme for Cinnamon 2.6"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/411"
license=('GPL')
depends=('cinnamon>=2.6.0' 'cinnamon<2.7.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/DKC0-D6WT-MA4P.zip")
sha256sums=('35b2371ccff518ba0f706ec21e1bdb507f4da100b098e93b2b789b4842075df0')

package() {
  find Ciliora-Secunda -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
