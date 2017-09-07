# Maintainer: levinit <levinit@outlook.com>
pkgname=ocsstore
pkgver=2.2.0
pkgrel=1
pkgdesc="OCS-Store frontend.Downloading and Managing Linux softwares,fonts,artworks,desktop-themes and so on."
arch=('x86_64')
url="https://www.linux-apps.com/p/1175480/"
license=('GPL')

source=("https://dl.opendesktop.org/api/files/download/id/1502985503/ocsstore-2.2.0-1-x86_64.pkg.tar.xz")
md5sums=('SKIP')

prepare(){
    rm ../ocsstore-2.2.0-1-x86_64.pkg.tar.xz
}

package() {
    cp -r $srcdir/usr $pkgdir
}
