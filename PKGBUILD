# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="zombietrackergps-bin"
pkgver=1.11
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
sha256sums_x86_64=('2eda5def2480a39ab85fc06577eafe8e595f3a6a64d00f017478604f0a5dbc28')
sha256sums_i386=('33a3708850f55cc8ca5c892e2843ad2e75e3ea17c7691e63f18c1aa6c5d3557e')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "usr" "$pkgdir"
}
