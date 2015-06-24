# Maintainer: mibbio <contact at mibbiodev dot de>

pkgname=cinnamon-theme-ciliora-prima
pkgver=20150624
pkgrel=1
pkgdesc="Ciliora-Prima theme for Cinnamon 2.6"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/323"
license=('GPL')
depends=('cinnamon>=2.6.0' 'cinnamon<2.7.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/C59X-BR2Q-P3IV.zip")
sha256sums=('d9a3b431b0083529ab4b329712714be5535b44ce73a5a84ae0cd2ceaf829b700')

package() {
  find Ciliora-Prima -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
