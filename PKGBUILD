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
  'a294e2d4df0652078acf12fb07a36f2f7eee1951ce3b55c29154f58c002dcc50c649efbcfae46612d831dc9ecc5749a28a2463304a3f46a897c0753069c042f8'
  '87cccea6bdcb24c0202bec95051f790e920e9775fa62c1545d341927ed863fab7bd7ae3e01f6c612b0041162e9737504a42622ac06e4b57e36fb93ff8ef81059'
  )
md5sums=(
  'bfa67c76d1a24e1e95e0686c91e637e8'
  'da424c2a892e0e5753b6736d5913ed25'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
