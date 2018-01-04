# Maintainer: CountMurphy
# Contributor: Morten Linderud <foxboron@archlinux.org> 
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgbase=font-awesome4
pkgname=(ttf-font-awesome4 otf-font-awesome4)
pkgver=4.7.0
pkgrel=1
pkgdesc="Iconic font designed for Bootstrap"
url="http://fontawesome.io/"
arch=('any')
depends=('fontconfig')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortAwesome/Font-Awesome/archive/v$pkgver.tar.gz"
	)
	sha256sums=('de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43')

package_ttf-font-awesome4() {
  cd "Font-Awesome-$pkgver/fonts"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}

package_otf-font-awesome4() {
  cd "Font-Awesome-$pkgver/fonts"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
}

