# Maintainer: Omar Emara <mail@OmarEmara.dev>
pkgname=nnd-bin
pkgver=0.71
pkgrel=1
pkgdesc="A debugger for Linux."
arch=('x86_64')
url="https://github.com/al13n321/nnd"
license=('Apache-2.0')
source=("nnd::https://github.com/al13n321/nnd/releases/download/v${pkgver}/nnd")
sha256sums=('3774bfa8075c631c75938892ae09b2dbf37119ae9bce55c1f66d789323d298c5')
conflicts=('nnd')
options=('!strip')

package() {
  install -Dm 755 "${srcdir}/nnd" "${pkgdir}/usr/bin/nnd"
}

