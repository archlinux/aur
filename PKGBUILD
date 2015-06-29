# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Prima'
pkgname=cinnamon-theme-${_name,,}
pkgver=20150624
pkgrel=3
pkgdesc="${_name} theme for Cinnamon 2.6"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/323"
license=('GPL')
depends=('cinnamon>=2.6.0' 'cinnamon<2.7.0')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/C59X-BR2Q-P3IV.zip")
sha256sums=('d9a3b431b0083529ab4b329712714be5535b44ce73a5a84ae0cd2ceaf829b700')

package() {
  find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
