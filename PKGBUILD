# Maintainer: Omar Emara <mail@OmarEmara.dev>
pkgname=nnd-bin
pkgver=0.65
pkgrel=1
pkgdesc="A debugger for Linux."
arch=('x86_64')
url="https://github.com/al13n321/nnd"
license=('Apache-2.0')
source=("nnd::https://github.com/al13n321/nnd/releases/download/v${pkgver}/nnd")
sha256sums=('d5a47ad6a26bd5c14c4a2821d791ba4d17acb885eec31aeebad6c16e25930c06')
conflicts=('nnd')
options=('!strip')

package() {
  install -Dm 755 "${srcdir}/nnd" "${pkgdir}/usr/bin/nnd"
}

