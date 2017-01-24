# Maintainer: Dany Marcoux <danymarcoux+archlinux@gmail.com>

pkgname=lf
pkgver=nightly
pkgrel=2
pkgdesc='lf: A terminal file manager, heavily inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
provides=('lf')
source_i686=("https://github.com/gokcehan/lf/releases/download/$pkgver/lf-linux-386.tar.gz")
source_x86_64=("https://github.com/gokcehan/lf/releases/download/$pkgver/lf-linux-amd64.tar.gz")
md5sums_i686=('2e273d3005e371a889ec034d81eff9a0')
md5sums_x86_64=('8856a5cc36043ceeaed822f9c3fc775a')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
