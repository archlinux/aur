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
  'ac69590a7b7eec9bce5ab179bf90974e0331da8cf1b300ecd2b67f844aff13fac70a04eb34b48cc171b357b4db5bbf0d34694a8e3ab7f2274e4b00fc6300cd6e'
  'bcffaf37c852d2afb74b89f127659857218a78b1156bfd5c04ae85445bcaf9b157fe3c22aa2014802f8cf0547e4b6a161cd087c9b4e328021a7204b531391bda'
  )
md5sums=(
  'b232dd4719ee695d52a9cadb7b5e9323'
  'f7b123d31aed034583d8107a2652aa7c'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
