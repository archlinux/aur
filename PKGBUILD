# Maintainer: Omar Emara <mail@OmarEmara.dev>
pkgname=nnd-bin
pkgver=0.70
pkgrel=1
pkgdesc="A debugger for Linux."
arch=('x86_64')
url="https://github.com/al13n321/nnd"
license=('Apache-2.0')
source=("nnd::https://github.com/al13n321/nnd/releases/download/v${pkgver}/nnd")
sha256sums=('3cc676d2043e5e520faa9c4a637da82178c0b066dc7d9caa247af9b52ed96f12')
conflicts=('nnd')
options=('!strip')

package() {
  install -Dm 755 "${srcdir}/nnd" "${pkgdir}/usr/bin/nnd"
}

