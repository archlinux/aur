# Maintainer: Eragon <sam.vzh@gmail.com>
pkgname=bide
pkgver=4.3
pkgrel=3
pkgdesc="BIDE, Basic IDE by Zezombye"
arch=("any")
url="https://www.planet-casio.com/Fr/logiciels/voir_un_logiciel_casio.php?showid=118"
license=('GPL')
depends=("jre8-openjdk")
provides=("bide")
source=("https://www.planet-casio.com/Fr/logiciels/dl_logiciel.php?id=118&file=1")
md5sums=("735d5cc2265c137047617418dadc09ca") #generate with 'makepkg -g'

build() {
    unzip 'dl_logiciel.php?id=118&file=1'
    unzip BIDE.jar
}

package() {
    mkdir -p opt/bide
    cp BIDE.jar opt/bide/bide.jar
    cp BIDEicon.png opt/bide/bide_icon.png
}

