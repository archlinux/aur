# Maintainer: Aoibhinn Nic Aoidh <oibind@pm.me>
# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf-bin
pkgver=22
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("lf-$pkgver-linux-386.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("lf-$pkgver-linux-amd64.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("lf-$pkgver.linux-arm.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('d976467417a8c74427eff2ae4d2be93e6c0e812e5bde664a2e957e69a2ddc50e')
sha256sums_x86_64=('270f6712c6da24f752234ac0af92a2dba27208c6914cf8853d26d9de6d2f0b11')
sha256sums_armv7h=('c5a039cccab807560b5fcfcd09d117f1fe086861652f2c3fe7f90d170001c663')
provides=('lf')
conflicts=('lf')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
