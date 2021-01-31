# Maintainer: Aoibhinn Nic Aoidh <oibind@pm.me>
# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf-bin
pkgver=20
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("lf-$pkgver-linux-386.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("lf-$pkgver-linux-amd64.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("lf-$pkgver.linux-arm.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('1a8fe5ca867557ac695ff92c8e04f2adaee60c47bf8be80b41a36bd4d8d74440')
sha256sums_x86_64=('d88d3865e209d25728fa4291a032094790cc744195ee803224d2818433c036b4')
sha256sums_armv7h=('0886c2f035249f5f93c411eb0a72bf3dfe5769059472b61fb90929830dbfa894')
provides=('lf')
conflicts=('lf')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
