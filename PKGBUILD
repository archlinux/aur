# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=nav
pkgver=1.1
pkgrel=1
pkgdesc="A means of quick navigation through directories in the CLI"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(dialog fzf)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'a0a0167c0d5dcbd1cffa2afc4fc7eccc9c498fc626e4d3df074970ff279efc3a8f5d6524aafc9cfe0a151ff2062d84f45b361c44b37f4338540bca0b6d449d36'
  '8792bb6780de28bd6d4997b9732b3e7178471d64214f9358e613056ac6f38ed11512f28eaf1b9adf296831ac402afd9ffc2a7eb7f04e54f7a823f852f37a6e3a'
  )
md5sums=(
  'd46defaefda8bd63c3c12d345fc6725c'
  '85db5f337d73a3f36cb73c6456ec352d'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
