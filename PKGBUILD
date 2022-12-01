# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qed
pkgver=0.1.1
pkgrel=1
arch=(any)
pkgdesc="Quick Edit - A CLI tool to quickly edit and save files saved slots 1-10"
url="https://gitlab.com/a4to/${pkgname}"
install="qed.install"
license=('MIT')
depends=(dialog)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'ed98ae6153d019089bed247dcf9e97bc200937e8b7a3a2cb31a53404e7f55f9c433819a9445c01b06f4fc4f9e32f797dfe606ae9a21b2731c2693794be549b23'
  '69f316a7f012109ae382dd4a076b438e4e91ef434ca5615a24df4fbdc9f87cd7fa1cb110bc570c9298d0eb560e653f96f1d877e28d66c85b8a439dc6dae961d9'
  )
md5sums=(
  'cc3a704c6f950c8442ef55e0d38a6057'
  'e7f64624eb51f3a49a667f50aafa18e9'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
