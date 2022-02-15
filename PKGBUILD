# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="zombietrackergps-bin"
pkgver=1.10
pkgrel=1
pkgdesc="GPS track manager for Qt using KDE Marble maps. Currently supports GPX and TCX format import."
url="https://www.zombietrackergps.net/ztgps/"
license=("GPL3")
arch=("x86_64" "i386")
provides=("zombietrackergps")
conflicts=("zombietrackergps-git")
depends=("marble-qt" "qt5-base" "qt5-charts" "qt5-svg")
source_x86_64=("https://www.zombietrackergps.net/ztgps/Downloads/$pkgver/zombietrackergps-${pkgver}_amd64.deb")
source_i386=("https://www.zombietrackergps.net/ztgps/Downloads/$pkgver/zombietrackergps-${pkgver}_i386.deb")
sha256sums_x86_64=('99f63263d3cf13c351bfba601f4828064c859cd47fa20ca454d7ca706deded7a')
sha256sums_i386=('2ef68b90e58904bc611a7dfcef0df3f769282b73b1782785c19fd2fac9e61375')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "usr" "$pkgdir"
}
