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
  '593302aeee7032f99a9bb41bbb5a52248d4ecf7d68e7a381b64a6ad422c573bd828822577a93cc4646a140ce14fbcc69c3c3f74881868987b001d4b6b7778023'
  '3de0eae951a20e63b5bc060c0a0dc60994b6586ceb9bcf9ef7af02eb9ed7edcf738d1dc292112ffc7b639dabe46abdcfa46795d2fcb3eb273137a832daddcdba'
  )
md5sums=(
  '3ab0a845da00597b7abf6ef901293ac5'
  'aabe69f99400a84c6eaf926cb901b5f5'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin"
}
