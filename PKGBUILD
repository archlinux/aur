# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="zombietrackergps-bin"
pkgver=1.08
pkgrel=1
pkgdesc="GPS track manager for Qt using KDE Marble maps. Currently supports GPX and TCX format import."
url="https://www.zombietrackergps.net/ztgps/"
license=("GPL3")
arch=("x86_64")
provides=("zombietrackergps")
conflicts=("zombietrackergps-git")
depends=("marble-qt" "qt5-base" "qt5-charts" "qt5-svg")
source=("https://www.zombietrackergps.net/ztgps/Downloads/$pkgver/zombietrackergps-${pkgver}_amd64.deb")
sha256sums=("37201c281177fc08430e1a2999652d2a31dfa188555ed481bcacd082509f567e")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "usr" "$pkgdir"
}
