# Maintainer: mirandir <mirandir@orange.fr>

pkgname=magiccollection
pkgver=0.8.10
pkgrel=2
pkgdesc="Magic Collection is a small program to manage your collection of Magic: the Gathering cards (software in french only)."
arch=('any')
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject' 'python-lxml')
url="http://mirandir.pagesperso-orange.fr/magiccollection/"
source=(http://mirandir.pagesperso-orange.fr/files/"$pkgname"_"$pkgver".tar.xz)
sha256sums=('f2e8d0941eb2f46473798310f0e676ca6b5a27f09354b0123b2300ecb238a035')

package() {
        cd "$srcdir"

        install -d $pkgdir/usr/share/{applications,magiccollection}
        install -d $pkgdir/usr/share/magiccollection/{images,functions,signals}
        cp -r images/* $pkgdir/usr/share/magiccollection/images/
        cp -r functions/* $pkgdir/usr/share/magiccollection/functions/
        cp -r signals/* $pkgdir/usr/share/magiccollection/signals/
        
        cp globals.py $pkgdir/usr/share/magiccollection
        cp gpl3.txt $pkgdir/usr/share/magiccollection
        cp magic_collection.glade $pkgdir/usr/share/magiccollection
        cp magic_collection.py $pkgdir/usr/share/magiccollection
        cp mclogo.png $pkgdir/usr/share/magiccollection
        cp mclogo_min.png $pkgdir/usr/share/magiccollection
        cp buttonlogomenu.css $pkgdir/usr/share/magiccollection
        cp magiccollection.desktop $pkgdir/usr/share/applications
}
