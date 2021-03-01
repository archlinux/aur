# Maintainer: Aoibhinn Nic Aoidh <oibind@pm.me>
# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf-bin
pkgver=21
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("lf-$pkgver-linux-386.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("lf-$pkgver-linux-amd64.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("lf-$pkgver.linux-arm.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('13288fd131ed8c9c388095e8598f1f17272c5f9fcaf91c6b3fe81317442b8bb4')
sha256sums_x86_64=('059bf8c47d90d22d58cc42bdce27ab4d5f97d640ca0029ee1fc6f1f1557cfde0')
sha256sums_armv7h=('296fc9aae536738b6a72dbfd91e8658fabfdbc63bf2f706355cfc2e3cfd0b9c8')
provides=('lf')
conflicts=('lf')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
