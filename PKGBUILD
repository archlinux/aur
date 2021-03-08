# Maintainer: mareex <marcus dot behrendt dot 86 at gmail dot com>

pkgname=square-beam-icon-theme
pkgver=1.0
pkgrel=5
pkgdesc="Icons set for Linux distribution with more than 30.000 icons included."
arch=('any')
url="http://gnome-look.org/content/show.php/Square-Beam?content=165094&PHPSESSID=fe02219631ab9c62f787bf3ae835ae41"
license=('GPL')
source=("http://ppa.launchpad.net/noobslab/icons/ubuntu/pool/main/s/square-beam-icons/square-beam-icons_1.0-a~xenial~NoobsLab.com.tar.gz")
sha512sums=('39ce067ba17f62bd6b5425f9af5625c57c4ea0576d358ea21967ae9dae96e9810c196d86e55ac7a2151a39ec514e569028c2c8322be3f9e3e768d89ea9929160')

package() {
    mkdir -p "$pkgdir/usr/share/icons"
    cp -dr --no-preserve=ownership "$srcdir/square-beam/Square-Beam" "$pkgdir/usr/share/icons/"
    chmod -R u+rwX,go+rX,go-w "$pkgdir/usr/share/icons/Square-Beam"
}
