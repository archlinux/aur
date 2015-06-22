# Maintainer: mibbio <contact at mibbiodev dot de>

pkgname=cinnamon-theme-ciliora-secunda
pkgver=20150429
pkgrel=1
pkgdesc="Ciliora-Secunda theme for Cinnamon 2.4"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/411"
license=('GPL')
depends=('cinnamon>=2.4.0' 'cinnamon<2.5.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/BLI6-T6I8-GR51.zip")
sha256sums=('f2f1b5bd8db1a7c74d3bb1f782d506a1445d91acba5de7d6237e4c05569d8fe3')

package() {
  find Ciliora-Secunda -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
