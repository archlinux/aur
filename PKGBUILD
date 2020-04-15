# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf-bin
pkgver=14
pkgrel=2
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("lf-$pkgver-linux-386.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("lf-$pkgver-linux-amd64.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("lf-$pkgver.linux-arm.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('a63ddad2ed10d1e0b32a3402f8faa24664772012b9f15b28d51aede434a11b71')
sha256sums_x86_64=('c0837a5facf7bd3457b2300771531d5132120be8695c5665fc95b8af26005292')
sha256sums_armv7h=('8e658796e26ac6a2f62697fb30df1cc49aa3d65523a0d99ae395a2733d4c731e')
provides=('lf')
conflicts=('lf')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
