# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="zombietrackergps-bin"
pkgver=1.15
pkgrel=1
pkgdesc="GPS track manager for Qt using KDE Marble maps. Currently supports GPX and TCX format import."
url="https://www.zombietrackergps.net/ztgps"
license=("GPL3")
arch=("x86_64" "i386")
provides=("zombietrackergps")
conflicts=("zombietrackergps-git")
depends=("marble-qt" "qt5-base" "qt5-charts" "qt5-svg" "qt5-webkit")
source_x86_64=("$url/Downloads/$pkgver/zombietrackergps_${pkgver}_amd64.deb")
source_i386=("$url/Downloads/$pkgver/zombietrackergps_${pkgver}_i386.deb")
sha256sums_x86_64=('05b2909a79c15396736a6e0715cb159316df8f14b0180d2d3e17594ab7e8ed80')
sha256sums_i386=('54556b27a4e57c53d1603a38c62c282dd081427a10f22e2828c4c880c867701e')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "usr" "$pkgdir"
}
