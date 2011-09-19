# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Original maintainer: Lakota Morris <lakota.james@gmail.com>

pkgname=mcskinedit
pkgver=alpha3pre5
pkgrel=1
pkgdesc="Minecraft Skin Editor"
arch=(any)
license=('custom')
url="http://www.minecraft.net/"
depends=('java-runtime')
source=('http://solidcdn.com/files/27e8/SkinEdit_alpha3_pre7_fix.zip'
        'mcskinedit'
        'http://dl.dropbox.com/u/15956363/skintest2.jar')
md5sums=('82a1afca96026e3c5bfc5a690f1a8275'
         'feacb66ff8b71fbf00d13bcb0f829f43'
         'ec418807008ad3f14d55db6457a693b8')


build() {
    cd "$srcdir" || return 1

    mkdir -p $pkgdir/usr/bin
    cp mcskinedit $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/mcskinedit
    cp MCSkinEdit.jar $pkgdir/usr/share/mcskinedit
    cp skintest2.jar $pkgdir/usr/share/mcskinedit
    cp -r parts $pkgdir/usr/share/mcskinedit
    cp -r backgrounds $pkgdir/usr/share/mcskinedit

}

# vim:set ts=4 sw=4 et:
