# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nssdefinitions-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Finding NWScript function definitions made with VSC integration in mind"
arch=('any')
url="https://gitlab.com/Taro94/nwscript-definitions"
license=('GPL')
source=("https://gitlab.com/Taro94/nwscript-definitions/uploads/2d96e47a1c9f00901256e6323f605d17/nssdefinitions.tar.7z")
md5sums=('65d92b686605f9fc71ef38db1fa778cc')
options=(!strip)

package() {
    tar -xvf nssdefinitions.tar
    install -Dm 755 "nssdefinitions" -t "$pkgdir/usr/bin"
}
