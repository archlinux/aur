# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf-bin
pkgver=11
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('a05af9998f289d5f6b03bba5843e814f8eb3f56d1503ae802403b4555b4becb3')
sha256sums_x86_64=('3fd1921af781e5b3976614d131c89de872536d189b7fd3b09843d1d278cf0f08')
sha256sums_armv7h=('bcdaad43a08198efbf42af98af50be3aa108bceac625b50f0fee8c370c97bd44')
provides=('lf')
conflicts=('lf')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
