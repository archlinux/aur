# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qed
pkgver=0.1.0
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
  '09354ba5dd61e6708854d005243ece0ceebb267b227c1de5e1da3436aff8cde2afbaad04e94e2f9a7a916621c6b28b951a02c2d1b5698086a58c05694ba57d6e'
  'fbcca033d8fde4fccdd911a58ecaa65d0741752f395a80cb94fa8cc09253e1921f0064930bd01b6154d897d70cf40d86910f04efdcd9c12c9fe4022cfcf3d9e8'
  )
md5sums=(
  '6add8565f2659dd4d06ae97376f66dd4'
  'f0c0d2c88d0877d1a1456f9384c43b84'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
