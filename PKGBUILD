# Maintainer: mareex <marcus dot behrendt dot 86 at gmail dot com>

pkgname=square-beam-icon-theme
pkgver=1.0
pkgrel=5
pkgdesc="Icons set for Linux distribution with more than 30.000 icons included."
arch=('any')
url="http://gnome-look.org/content/show.php/Square-Beam?content=165094&PHPSESSID=fe02219631ab9c62f787bf3ae835ae41"
license=('GPL')
source=("http://ppa.launchpad.net/noobslab/icons/ubuntu/pool/main/s/square-beam-icons/square-beam-icons_1.0-a~zesty~Noobslab.com.tar.gz")
sha512sums=('c6a8b4a9d397fa818175aaff72d204d8cc97f6bb00bb19af60617b7ccf3a367b7b32d848df31688c90a582639ee1589e3eaeaa84af60132f5e22651ceaa52907')

package() {
    mkdir -p $pkgdir/usr/share/icons
    cp -dr --no-preserve=ownership $srcdir/square-beam/Square-Beam $pkgdir/usr/share/icons/
    chmod -R u+rwX,go+rX,go-w $pkgdir/usr/share/icons/Square-Beam
}
