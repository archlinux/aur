# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=toolkit
pkgver=0.1.0
pkgrel=1
pkgdesc="A toolbox for the CLI, rapidly speeding up file editing and data management processes."
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(bat)
optdepends=('nvim: the recommended editor for power users')
conflicts=(qed)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '94b0abd63433769bec8b5c4da3077ba5a770dd09880b7db5bfa287a0db869bd1bbf5f8765ff532e9aad8de51d7c55f5d3503fbb6918e1cedc8ffb2cbc06e769c'
  'b3f2305c6204c2612028065236cc4c69450aea1a8f324ffc5843415a3f908232e50cda47e7d64a6c20f2e808a970b775c69c51503c4def461dfbbe53b2ce92f0'
  )
md5sums=(
  '12ee334676c4e955267a88968339d0a9'
  '5edff1b2a2a0103ebb8ed5cc7e69b0ea'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin"
}
