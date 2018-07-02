# Maintainer: Eragon <sam.vzh@gmail.com>
pkgname=bide
pkgver=4.3
pkgrel=5
pkgdesc="BIDE, Basic IDE by Zezombye"
arch=("any")
url="https://www.planet-casio.com/Fr/logiciels/voir_un_logiciel_casio.php?showid=118"
license=('GPL')
depends=("jre8-openjdk")
provides=("bide")
source=("https://www.planet-casio.com/Fr/logiciels/dl_logiciel.php?id=118&file=1")
md5sums=('735d5cc2265c137047617418dadc09ca')

build() {
    unzip 'dl_logiciel.php?id=118&file=1'
    unzip BIDE.jar
}

package() {
    mkdir -p $pkgdir/opt/bide
    cp BIDE.jar $pkgdir/opt/bide/bide.jar
    cp images/BIDEicon.png $pkgdir/opt/bide/bide_icon.png
}

