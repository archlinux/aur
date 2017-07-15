# Contributor: Archadept
#    Revision: 2017-07-15

pkgname=osdark-rfx-green
pkgver=20120211
pkgrel=2
pkgdesc="Green icon theme for xfce"
url="https://www.xfce-look.org/content/show.php/OSDark+RFX?content=139893"
arch=(any)
license=('GPL')
source=(https://www.dropbox.com/s/hd9qmjd3ah1tuty/OSDark-green-$pkgver.tar.bz2?dl=0 https://dl.opendesktop.org/api/files/download/id/1460765597/139892-OSDark-dist-$pkgver.tar.bz2 index.theme)
md5sums=('057edbb93e2a3ba049173ce9a45d0411'
'dfe1720c7e5c2a750a7d38afc395bac3'
'bb175e512d5a714bdc7a041f19d4e82c')

package() {
    mkdir -p "$pkgdir/usr/share/icons/"
    # Installing theme
    cp -R $startdir/src/OSDark-green $pkgdir/usr/share/icons/
    cp $startdir/src/OSDark-dist/arch.png $pkgdir/usr/share/icons/OSDark-green/128x128/places/start-here.png
    cp $startdir/src/OSDark-dist/arch-16.png $pkgdir/usr/share/icons/OSDark-green/16x16/places/start-here.png
    cp $startdir/src/OSDark-dist/emblem-arch.png $pkgdir/usr/share/icons/OSDark-green/128x128/emblems/emblem-arch.png
    # Updating index
    cp $startdir/index.theme $pkgdir/usr/share/icons/OSDark-green/
}
