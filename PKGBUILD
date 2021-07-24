# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="zombietrackergps-bin"
pkgver=1.09
pkgrel=1
pkgdesc="GPS track manager for Qt using KDE Marble maps. Currently supports GPX and TCX format import."
url="https://www.zombietrackergps.net/ztgps/"
license=("GPL3")
arch=("x86_64" "i386")
provides=("zombietrackergps")
conflicts=("zombietrackergps-git")
depends=("marble-qt" "qt5-base" "qt5-charts" "qt5-svg")
source_x86_64=("https://www.zombietrackergps.net/ztgps/Downloads/$pkgver/zombietrackergps-${pkgver}_amd64.deb")
source_i386=("https://www.zombietrackergps.net/ztgps/Downloads/1.09/zombietrackergps-${pkgver}_i386.deb")
sha256sums_x86_64=("f1650857c8d5a9d575a2af7f270044af1933eeaade88878702c0d637d11373dd")
sha256sums_i386=("94f14e2e129c6d105eddf99dffc9b4f5ad1f621053b2a1845680813ab0216be3")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "usr" "$pkgdir"
}
