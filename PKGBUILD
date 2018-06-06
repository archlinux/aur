# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Elena ``of Valhalla'' Grandi <gmail.com: elena.valhalla>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=ttf-symbola
pkgver=11.00
pkgrel=1
pkgdesc="Font for unicode symbols (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=("${pkgname}-${pkgver}.zip::http://users.teilar.gr/~g1951d/Symbola.zip"
	"LICENSE")
sha256sums=('9388978165fdd781097656ad6f1111c2641ae5281613e9aebf0203c1dcd638a0'
            'd1558ac65a0bafd51f412ce91f35af9a000bd4de153d30b1110f34b16ca80f12')

package() {
  install -Dm644 Symbola.ttf "$pkgdir/usr/share/fonts/TTF/Symbola.ttf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
