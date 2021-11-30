# Maintainer: darkelectron <darkelectron(dot)aur(at)tutanota.com
# Contributor: Aoibhinn Nic Aoidh <oibind@pm.me>
# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf-bin
pkgver=26
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("lf-$pkgver-linux-386.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("lf-$pkgver-linux-amd64.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("lf-$pkgver.linux-arm.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('09eabddcf198395171392cb82b4f5834f9e54509b99b35e883022ca41d95352c')
sha256sums_x86_64=('0a07b8cbceadac4fea003f55f6ba5afa03cbb87261b1f6d2c8933286996ded75')
sha256sums_armv7h=('8a94ef07d35e41095bf8b218ab2cc2f71cb9f15eb91b2aa684f24693ab9a6886')
provides=('lf')
conflicts=('lf')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
