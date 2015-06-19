# Maintainer: Albert Kugel (Lastebil) (lastebilaur@trebel.org)
# Contributor: Krzysztof Raczkowski <raczkow@gmail.com>

pkgname=xcursor-chameleon-pearl
pkgver=0.5
pkgrel=2
pkgdesc="Chameleon X Cursor Theme (pearl flavour)"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=38459"
license=('GPL')
depends=('libxcursor')
source=(http://www.egregorion.net/works/chameleon/Chameleon-Pearl-0.5.tar.bz2)
md5sums=('735fa20089d8248e56007b130cf10064')

package() {
  mkdir -p "$pkgdir/usr/share/icons"

  cp -r \
  "$srcdir/Chameleon-Pearl-Large-0.5" \
  "$srcdir/Chameleon-Pearl-Regular-0.5" \
  "$srcdir/Chameleon-Pearl-Small-0.5" \
  "$pkgdir/usr/share/icons"
}
