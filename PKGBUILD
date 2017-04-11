# Maintainer: Dany Marcoux <danymarcoux+archlinux@gmail.com>

pkgname=lf
pkgver=nightly
pkgrel=4
pkgdesc='lf: A terminal file manager, heavily inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
provides=('lf')
source_i686=("https://github.com/gokcehan/lf/releases/download/$pkgver/lf-linux-386.tar.gz")
source_x86_64=("https://github.com/gokcehan/lf/releases/download/$pkgver/lf-linux-amd64.tar.gz")
md5sums_i686=('e5d8a5b95d8f10020e7cfb8031ad08ce')
md5sums_x86_64=('570984e7368fe2c551fa7a0d926e863f')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
