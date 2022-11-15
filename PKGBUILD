# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qed
pkgver=0.1.0
pkgrel=1
pkgdesc="Quick Edit - A CLI tool to quickly edit and save files saved slots 1-10"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(dialog)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '153b76f65c456f13b5b802ad4d62d606463e901ef8a413698179e61758f1ddb86e49bb57bc8d969554f545d4fb681f5107a6ecc1f0a8e8e33f65cc29700ede26'
  'dfe3a0c23599faf4a0433d0c4321b93d7afe6a0397ae86458a23f6ce5677affe6a1d826ece1021e798f8a74b71d402d609148be52f7f4ed9e5d7c26220aa8f80'
  )
md5sums=(
  'd0e0e1114ad831a01ddfe2c30668b783'
  'ad1d866ea66a5bd9d2278b79162f776c'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
