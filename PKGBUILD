# Maintainer: darkelectron <darkelectron(at)mailfence.com>
# Contributor: Aoibhinn Nic Aoidh <oibind@pm.me>
# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf-bin
pkgver=33
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("lf-$pkgver-linux-386.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("lf-$pkgver-linux-amd64.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("lf-$pkgver.linux-arm.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('26adfa88b66bc85a839d2390bbdb629e17fd3e2224cdfbab939b1b58be6f7abf')
sha256sums_x86_64=('912eec333b664c4f2500fdbebbf92bec4d316ff68e6a6e31bb61126c51a1f9e1')
sha256sums_armv7h=('dd65f848a89b02b7b72edead1301f3c10399963a764601b780cc871414e48ad1')
provides=('lf')
conflicts=('lf' 'lf-git' 'lf-sixel-git')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
