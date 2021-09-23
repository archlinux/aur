# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nssdefinitions-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Finding NWScript function definitions made with VSC integration in mind"
arch=('any')
url="https://gitlab.com/Taro94/nwscript-definitions"
license=('GPL')
source=("https://gitlab.com/Taro94/nwscript-definitions/uploads/70c7181e3eb10d2f4b5c63a85b69035f/nssdefinitions.tar.7z")
md5sums=('7a0ccec446401ef95aef28e0a32c4961')
options=(!strip)

package() {
    tar -xvf nssdefinitions.tar
    install -Dm 755 "nssdefinitions" -t "$pkgdir/usr/bin"
}
