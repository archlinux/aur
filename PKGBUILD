# Maintainer: Mykola <mykola.kb@gmail.com>

pkgname=pkl-bin
_pkgname=pkl
pkgver=0.31.1
pkgrel=1
pkgdesc='A configuration as code language with rich validation and tooling.'
arch=('x86_64')
url='https://pkl-lang.org'
license=('Apache')
source_x86_64=("https://github.com/apple/pkl/releases/download/${pkgver}/pkl-linux-amd64")
sha256sums_x86_64=('618f13955d755cafbfe8c9cba1d27635848cd49dbc6abffd398d2751db1231bf')
provides=('pkl')
conflicts=('pkl' 'pkl-git')

package() {
  install -Dm755 "pkl-linux-amd64" "$pkgdir/usr/bin/pkl"
}
