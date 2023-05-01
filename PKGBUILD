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
  '3c08e020a8525f8881916bf060cd1141296e5c57ef0feac7c09690832a4e99090cf93c9099202a9d2f7ab5e8a739edf07e4ba9d0b96b317a8e46c1632852e831'
  '55488c913727f11f2cc9f0ac8efe1875460a21005e5e0c05c271b24e4eeb992b1c036f97b837386334a1703597e93e3b8194fa17a94025ec3c32b4cfd24f90bf'
  )
md5sums=(
  '204b874b8c08d8b56a45859302739765'
  '6b808fdf21483cd468e0295eaa0496c8'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {  
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
