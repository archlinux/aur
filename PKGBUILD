# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>

pkgname=lf-bin
pkgver=8
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('f794d5267843237d2bd491ca2f8bed9a956bb4084ada63e5c86a76fbbecc51c7')
sha256sums_x86_64=('532f1a579dac76ce89ff5176f057a8a32f6d882ccb0b0bd7e40a8abbb0506d21')
sha256sums_armv7h=('f939522d86a543ac9ddad5ae6e7571b5ed990ad4c56adbb8612bc64e58d163b3')
provides=('lf')
conflicts=('lf')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
