# Maintainer: Eragon <sam.vzh@gmail.com>
pkgname=bide
pkgver=4.4
pkgrel=4
pkgdesc="BIDE, Basic IDE by Zezombye"
arch=("any")
url="https://github.com/Zezombye/BIDE"
license=('GPL')
depends=("java-runtime=8")
provides=("bide")
source=("https://www.planet-casio.com/Fr/logiciels/dl_logiciel.php?id=118&file=1" "bide.desktop")
md5sums=('bf7418912defe6e7008dd0a257d7ef83'
         '1c3161370f1130ecd7fc8500d72ec1dc')

build() {
    unzip -o 'dl_logiciel.php?id=118&file=1'
    unzip -o BIDE.jar
}

package() {
    mkdir -p $pkgdir/opt/bide
    cp BIDE.jar $pkgdir/opt/bide/bide.jar
    cp images/BIDEicon.png $pkgdir/opt/bide/bide_icon.png
    mkdir -p $pkgdir/usr/share/applications/
    cp bide.desktop $pkgdir/usr/share/applications/bide.desktop
}

