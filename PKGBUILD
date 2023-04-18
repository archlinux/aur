# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="zombietrackergps-bin"
pkgver=1.14
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
sha256sums_x86_64=('1865dd6dff7b2e7342097e430355f63b7b17164e83d01dd6a2e27e8a034933cc')
sha256sums_i386=('aba0b8520df73488c04bbed0e8960bdf3400fa78353d848d597289eb2cbc2c9b')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "usr" "$pkgdir"
}
