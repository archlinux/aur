# Maintainer: Mykola <mykola.kb@gmail.com>

pkgname=pkl-bin
_pkgname=pkl
pkgver=0.27.0
pkgrel=1
pkgdesc='A configuration as code language with rich validation and tooling.'
arch=('x86_64')
url='https://pkl-lang.org'
license=('Apache')
source_x86_64=("https://github.com/apple/pkl/releases/download/${pkgver}/pkl-linux-amd64")
sha256sums_x86_64=('e4c76b6dd02456dac8d300ea1f1c50102f6414cb947567436477cbf7c2dab3aa')
provides=('pkl')
conflicts=('pkl' 'pkl-git')

package() {
  install -Dm755 "pkl-linux-amd64" "$pkgdir/usr/bin/pkl"
}
