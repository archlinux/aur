# Contributor: Will Smith (Factory, rpj8) <iliketoast@gmail.com>
pkgname=ultimate-gnome-icon-theme
_pkgname=UltimateGnome
pkgver=0.5.1
pkgrel=3
pkgdesc="An original theme created entirely by the author in Inkscape"
arch=(any)
url="http://www.gnome-look.org/content/show.php/Ultimate+Gnome?content=75000"
license=('GPL')
source=(http://ultimate-gnome.googlecode.com/files/${_pkgname}.$pkgver.tar.gz)
noextract=()
md5sums=('2803274beac6028343c48a41416516a1')

package() {
  mkdir -p "$pkgdir/usr/share/icons/"
  cp -r "$srcdir/${_pkgname}" "$pkgdir/usr/share/icons/"
  rm -f "$pkgdir/usr/share/icons/${_pkgname}/48x48/actions/document-open-recent.png"
}
