# Maintainer: Dylan Araps <dylan.araps@gmail.com>
# Old Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgbase=ttf-font-awesome-4
pkgname=(ttf-font-awesome-4 otf-font-awesome-4)
pkgver=4.7.0
pkgrel=5
pkgdesc="Iconic font designed for Bootstrap"
url="http://fontawesome.io/"
license=('custom:OFL')
arch=('any')
depends=('fontconfig')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortAwesome/Font-Awesome/archive/v$pkgver.tar.gz"
	"OFL")
sha256sums=('de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43'
            'fe4ddef88d2705569740a4b6c59e1a73315e1a55fb0a0d054bd791977681f8cb')

package_ttf-font-awesome-4() {
  install -Dm644 OFL "$pkgdir/usr/share/licenses/$pkgname/OFL"
  cd "Font-Awesome-$pkgver/fonts"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}

package_otf-font-awesome-4() {
  install -Dm644 OFL "$pkgdir/usr/share/licenses/$pkgname/OFL"
  cd "Font-Awesome-$pkgver/fonts"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
}
