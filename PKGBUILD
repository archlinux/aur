# Maintainer: darkelectron <darkelectron(at)mailfence.com>
# Contributor: Aoibhinn Nic Aoidh <oibind@pm.me>
# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf-bin
pkgver=34
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("lf-$pkgver-linux-386.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("lf-$pkgver-linux-amd64.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("lf-$pkgver.linux-arm.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('0f0e4abbe101b0c2dc5c112f505cfa5cffdec6b4aea76ac6fbbfed9a8a6b4763')
sha256sums_x86_64=('0f877dbdd073f67db7cc0d22bdf65064cb67a466d2b0c43b0bb2b375616486d5')
sha256sums_armv7h=('d1efee533178a7808ae4bd1afa6b0595863e25839f0d6d4ee2b934e81ac02c98')
provides=('lf')
conflicts=('lf' 'lf-git' 'lf-sixel-git')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
