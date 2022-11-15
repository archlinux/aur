# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qed
pkgver=0.1.0
pkgrel=1
pkgdesc="Quick Edit - A CLI tool to quickly edit and save files saved slots 1-10"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=()
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '324d5cb069f65a8dcd404ad53aa5413091375e30e3978f882779bf144998fadf078ea61f69ba41776664739b45bd9f76b7f10a5d937edfe7f1de50042d7e1bdd'
  '8b5a1ced8c295a0a4b58f0df3264bb0f984fa6150f97759db733057652acdb6b08bd763ca55dcb48cc278c83e739590bbafe33715ba0e3e60753bf96abbfb4d2'
  )
md5sums=(
  '27853452d766ce774ea6d5fb784236fc'
  'dac18f177cbc14769c225b5cb27ab400'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
