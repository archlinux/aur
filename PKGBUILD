# Maintainer: mareex <marcus dot behrendt dot 86 at gmail dot com>

pkgname=square-beam-icon-theme
pkgver=1.0
pkgrel=5
pkgdesc="Icons set for Linux distribution with more than 30.000 icons included."
arch=('any')
url="http://gnome-look.org/content/show.php/Square-Beam?content=165094&PHPSESSID=fe02219631ab9c62f787bf3ae835ae41"
license=('GPL')
source=("http://bit.ly/1sdnAo7")
md5sums=('a0b5dbab21e1d0a5fa55a42fce922724')

package() {
    mkdir -p $pkgdir/usr/share/icons
    cp -dr --no-preserve=ownership $srcdir/square-beam/Square-Beam $pkgdir/usr/share/icons/
    chmod -R u+rwX,go+rX,go-w $pkgdir/usr/share/icons/Square-Beam
}
