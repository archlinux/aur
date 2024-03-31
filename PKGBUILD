# Maintainer: darkelectron <darkelectron(at)mailfence.com>
# Contributor: Aoibhinn Nic Aoidh <oibind@pm.me>
# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf-bin
pkgver=32
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("lf-$pkgver-linux-386.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("lf-$pkgver-linux-amd64.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("lf-$pkgver.linux-arm.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('da2dc1ae6b6ac6c0cd8e538fe79900cd49250c8b84a921831c53cb517fc9e8d0')
sha256sums_x86_64=('f587e3acef5945232aabbf293bbc85d231ba299f179764a99171275219acdeb0')
sha256sums_armv7h=('81dd923787494f5c6a87eca697cbfb805a9d4a887502f061db5815e002120754')
provides=('lf')
conflicts=('lf' 'lf-git' 'lf-sixel-git')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
