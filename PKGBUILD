# Contributor: Archadept
#    Revision: 2017-07-15

pkgname=osdark-rfx-blue
pkgver=20120211
pkgrel=2
pkgdesc="Blue icon theme for xfce"
url="https://www.xfce-look.org/content/show.php/OSDark+RFX?content=139893"
arch=(any)
license=('GPL')
source=(https://www.dropbox.com/s/pamdrqfrpikr9vr/OSDark-blue-$pkgver.tar.bz2?dl=0 https://dl.opendesktop.org/api/files/download/id/1460765597/139892-OSDark-dist-$pkgver.tar.bz2 index.theme)
md5sums=('3691d5e9ab59d34faff04e5d2f2679a2'
'dfe1720c7e5c2a750a7d38afc395bac3'
'a6099a4db4d844df6e94d6f7a63bc14b')

package() {
    cd "$startdir/src/"
    mkdir -p "$pkgdir/usr/share/icons/"
    # Installing theme
    cp -R $startdir/src/OSDark-blue $pkgdir/usr/share/icons/
    cp $startdir/src/OSDark-dist/arch.png $pkgdir/usr/share/icons/OSDark-blue/128x128/places/start-here.png
    cp $startdir/src/OSDark-dist/arch-16.png $pkgdir/usr/share/icons/OSDark-blue/16x16/places/start-here.png
    cp $startdir/src/OSDark-dist/emblem-arch.png $pkgdir/usr/share/icons/OSDark-blue/128x128/emblems/emblem-arch.png
    # Updating index
    cp $startdir/index.theme $pkgdir/usr/share/icons/OSDark-blue/
}
