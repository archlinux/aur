# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="zombietrackergps-bin"
pkgver=1.09
pkgrel=1
pkgdesc="GPS track manager for Qt using KDE Marble maps. Currently supports GPX and TCX format import."
url="https://www.zombietrackergps.net/ztgps/"
license=("GPL3")
arch=("x86_64")
provides=("zombietrackergps")
conflicts=("zombietrackergps-git")
depends=("marble-qt" "qt5-base" "qt5-charts" "qt5-svg")
source=("https://www.zombietrackergps.net/ztgps/Downloads/$pkgver/zombietrackergps-${pkgver}_amd64.deb")
sha256sums=("f1650857c8d5a9d575a2af7f270044af1933eeaade88878702c0d637d11373dd")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "usr" "$pkgdir"
}
