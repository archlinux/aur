# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=snip
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple snippet manager for your predefined Ultisnips Snippet Directory"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(neovim)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'd295c1a63bbf2023d9b8238876a7f5865d3d784e599d5b2f5f6f464e7ba58b2ae8400f0d83f9cc979a396194e9673f1a30235a8f132e571150b05e367e406334'
  'a9d4ecda9cff864b9fcac1d6a456359eea4cba8989ccb7e445b1a2c926053574e5bdcda0311f0b1ec08f4e877c1cfbbe96977198dfe87e37eea884402b87c455'
  )
md5sums=(
  '1cf465c14e217d217bc86ecc5dc3fbf4'
  '303a7978aa9d758edc40fee6eb39834f'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {  
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
