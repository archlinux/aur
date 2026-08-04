# Maintainer: Mykola <mykola.kb@gmail.com>

pkgname=pkl-bin
_pkgname=pkl
pkgver=0.32.1
pkgrel=1
pkgdesc='A configuration as code language with rich validation and tooling.'
arch=('x86_64')
url='https://pkl-lang.org'
license=('Apache')
source_x86_64=("https://github.com/apple/pkl/releases/download/${pkgver}/pkl-linux-amd64")
sha256sums_x86_64=('3180b62da95c0cad1d904e9bb6c5f4a8f9032413c21e53194bb91ff1ee5f3211')
provides=('pkl')
conflicts=('pkl' 'pkl-git')

package() {
  install -Dm755 "pkl-linux-amd64" "$pkgdir/usr/bin/pkl"
}
