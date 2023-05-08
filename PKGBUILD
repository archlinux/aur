# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=snip
pkgver=1.1.3
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
  '68ee79d7028ef4a0f42db6b8a23f213466dad4b0e09fb5f21a5b57eee9188edcd07d40155368bff0dbd55cc8760d6695fccddc6d0cd21a6a8f649499502d6f95'
  '42177995fc3d968e2ef36840e9bb2a3a001ca202dff16830921c4e7bc832f26e624f348b09e1d105e99a0e254acb95ce49197c76d59db4564605dfe9a69209b7'
  )
md5sums=(
  '3c493d5fe6ab52b85aceb3a239aa5f43'
  '12dacf73c7ef833217565772a12a1ee3'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
