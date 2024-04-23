# Maintainer: Mykola <mykola.kb@gmail.com>

pkgname=pkl-bin
_pkgname=pkl
pkgver=0.25.3
pkgrel=1
pkgdesc='A configuration as code language with rich validation and tooling.'
arch=('x86_64')
url='https://pkl-lang.org'
license=('Apache')
source_x86_64=("https://github.com/apple/pkl/releases/download/${pkgver}/pkl-linux-amd64")
sha256sums_x86_64=('fb2c8ad5de113a1246599e893492736b79e73bdf986ba4caf305cd09aae82c10')
provides=('pkl')
conflicts=('pkl' 'pkl-git')

package() {
  install -Dm755 "pkl-linux-amd64" "$pkgdir/usr/bin/pkl"
}
