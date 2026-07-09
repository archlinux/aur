# Maintainer: Mykola <mykola.kb@gmail.com>

pkgname=pkl-bin
_pkgname=pkl
pkgver=0.32.0
pkgrel=1
pkgdesc='A configuration as code language with rich validation and tooling.'
arch=('x86_64')
url='https://pkl-lang.org'
license=('Apache')
source_x86_64=("https://github.com/apple/pkl/releases/download/${pkgver}/pkl-linux-amd64")
sha256sums_x86_64=('15e7e7375c28b8542b3d13fe35bccaeb7b9542114008998708385489885f41e7')
provides=('pkl')
conflicts=('pkl' 'pkl-git')

package() {
  install -Dm755 "pkl-linux-amd64" "$pkgdir/usr/bin/pkl"
}
