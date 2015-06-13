# Maintainer: Marco Pompili (marcs[dot]pompili[at]gmail[dot]com)
# Submitter: Gen2ly <toodrpartridge gmail>

pkgname=cheser-icon-theme
pkgver=3.16.0
pkgrel=1
pkgdesc="A near complete set of a mix of different Tango/Gnome-style icons."
arch=('any')
url="http://gnome-look.org/content/show.php/Cheser+Icon+Theme?content=113386"
license=('CC-BY-SA')
depends=('librsvg')
source=(https://github.com/chekavy/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('0b3383b1159bb7c5df2a0af31d03a48a')

package() {

  install -d -m755 ${pkgdir}/usr/share/icons/

  cd "$srcdir/$pkgname-$pkgver"

  cp -r "Cheser" "${pkgdir}/usr/share/icons"
}
