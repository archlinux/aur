# Maintainer: darkelectron <darkelectron(at)mailfence.com>
# Contributor: Aoibhinn Nic Aoidh <oibind@pm.me>
# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf-bin
pkgver=30
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("lf-$pkgver-linux-386.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("lf-$pkgver-linux-amd64.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("lf-$pkgver.linux-arm.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('d0c493576f469a50b682942eab5efeaa0d1007e253fc5057f1f0717e5683b44b')
sha256sums_x86_64=('8185b7838f84c3f8a9355b76229d24daf155f9001cfd3e3666ead546560d87d7')
sha256sums_armv7h=('5eeb67a57a647b7b9eefadee229474c589fbd598468c3890bce65966e6ecd788')
provides=('lf')
conflicts=('lf' 'lf-git' 'lf-sixel-git')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
