# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nssdefinitions-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Finding NWScript function definitions made with VSC integration in mind"
arch=('any')
url="https://gitlab.com/Taro94/nwscript-definitions"
license=('GPL')
source=("https://gitlab.com/Taro94/nwscript-definitions/uploads/5553b062c762ce57aed7047da03c8083/nssdefinitions.tar.7z")
md5sums=('ea4dae54a61e7edf959fc0ffe44a79c0')
options=(!strip)

package() {
    tar -xvf nssdefinitions.tar
    install -Dm 755 "nssdefinitions" -t "$pkgdir/usr/bin"
}
