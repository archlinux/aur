# Contributor: Archadept
#    Revision: 2017-07-15

pkgname=osdark-rfx-red
pkgver=20120211
pkgrel=2
pkgdesc="Red icon theme for xfce"
url="https://www.xfce-look.org/content/show.php/OSDark+RFX?content=139893"
arch=(any)
license=('GPL')
source=(https://www.dropbox.com/s/27v1mysxzeixtec/OSDark-$pkgver.tar.bz2?dl=0 https://dl.opendesktop.org/api/files/download/id/1460765597/139892-OSDark-dist-$pkgver.tar.bz2 index.theme)
md5sums=('f7d2f065b100597688bf8664e431b24d'
'dfe1720c7e5c2a750a7d38afc395bac3'
'8fe5222f1877f2e7fb75bd393ae4afa8')

package() {
    cd "$startdir/src/"
    mkdir -p "$pkgdir/usr/share/icons/"
    # Installing theme
    mv $startdir/src/OSDark $startdir/src/OSDark-red
    cp -R $startdir/src/OSDark-red $pkgdir/usr/share/icons/
    cp $startdir/src/OSDark-dist/arch.png $pkgdir/usr/share/icons/OSDark-red/128x128/places/start-here.png
    cp $startdir/src/OSDark-dist/arch-16.png $pkgdir/usr/share/icons/OSDark-red/16x16/places/start-here.png
    cp $startdir/src/OSDark-dist/emblem-arch.png $pkgdir/usr/share/icons/OSDark-red/128x128/emblems/emblem-arch.png
    # Updating index
    cp $startdir/index.theme $pkgdir/usr/share/icons/OSDark-red/
}

# vim:set ts=2 sw=2 et:
