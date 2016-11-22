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
md5sums_i686=('ec80368879f1b5f7ff015dc059833473')
md5sums_x86_64=('323ef3957df4a31bb6dc15ad0f56bf49')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
