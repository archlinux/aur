# Maintainer: Omar Emara <mail@OmarEmara.dev>
pkgname=nnd-bin
pkgver=0.80
pkgrel=1
pkgdesc="A debugger for Linux."
arch=('x86_64')
url="https://github.com/al13n321/nnd"
license=('Apache-2.0')
source=("nnd::https://github.com/al13n321/nnd/releases/download/v${pkgver}/nnd")
sha256sums=('0bec725a1a519d730d6a377c6fba08c90ccfe2ced99d31ab4b9572e2918af8fd')
conflicts=('nnd')
options=('!strip')

package() {
  install -Dm 755 "${srcdir}/nnd" "${pkgdir}/usr/bin/nnd"
}

