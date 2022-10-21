pkgname=zlodej
pkgver=V1.7E+patch
pkgrel=1
pkgdesc="Zloděj (The Clue!)"
arch=(any)
url=https://sourceforge.net/projects/cosp/
license=(unknown)
depends=(derclou-git)
install=zlodej.install
source=(https://download.sf.net/cosp/Original%20Game%20Files/The%20Clue%21%20%28Czech%29/ClueCZ.zip)
md5sums=(18966a76e3911db6e185be77aba925b3)
package(){
    rm DATADISK/GAMES.LST   # keep after package removal
    install -dm757 $pkgdir/usr/share/zlodej/DATADISK
    cp -r DATA{,DISK} INTROPIX PICTURES SAMPLES SOUNDS TEXTS $pkgdir/usr/share/zlodej
}
