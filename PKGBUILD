# Maintainer: Omar Emara <mail@OmarEmara.dev>
pkgname=nnd-bin
pkgver=0.57
pkgrel=1
pkgdesc="A debugger for Linux."
arch=('x86_64')
url="https://github.com/al13n321/nnd"
license=('Apache-2.0')
source=("nnd::https://github.com/al13n321/nnd/releases/download/v${pkgver}/nnd")
sha256sums=('18d9831dd1d83d63464ab11eeee9410bc783255c8df7fe8704a6a3a429c83062')
conflicts=('nnd')
options=('!strip')

package() {
  install -Dm 755 "${srcdir}/nnd" "${pkgdir}/usr/bin/nnd"
}

