# Maintainer: Pierre Carru <pierre@carru.fr>

pkgname=inspect
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=0.6.9
pkgrel=1
arch=('x86_64')
url='https://inspect.dev'
license=('proprietary')
#options=('!strip')
source=("https://github.com/inspectdev/inspect-release/releases/download/v${pkgver}/Inspect-${pkgver}-linux-amd64.deb")
sha256sums=('f717daaaba79ffa71d02d64a3d6887fc09fad9821184c6dbdb4449755a019781')

prepare() {
  bsdtar -x -f data.tar.xz
}

package() {
  cp -rv usr opt $pkgdir/
}
