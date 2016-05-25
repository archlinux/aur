# Maintainer: Marco Pompili (marcs[dot]pompili[at]gmail[dot]com)
# Submitter: Gen2ly <toodrpartridge gmail>

pkgname=cheser-icon-theme
pkgver=3.20.0
pkgrel=1
pkgdesc="A near complete set of a mix of different Tango/Gnome-style icons."
arch=('any')
url="http://gnome-look.org/content/show.php/Cheser+Icon+Theme?content=113386"
license=('CC-BY-SA')
depends=('librsvg')
source=(https://github.com/chekavy/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('4d2380d4bd170761202d4bc5e99f8437')

package() {

  install -d -m755 ${pkgdir}/usr/share/icons/

  cd "$srcdir/$pkgname-$pkgver"

  cp -r "Cheser" "${pkgdir}/usr/share/icons"
}
