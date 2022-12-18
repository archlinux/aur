# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=btcli
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple, easy to use, CLI bluetooth connections manager"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=()
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '61142e74ccd70ef40f25a4064235504ee32ed461b5f702c1d9d6159623f0b2f0b58d5146ad56c45a35c8e2a3b521b1054041a844c093103011ddb4e55f3fcfc4'
  'eeb5edbbabccd266ebbfb06656bc4d2bd983eb6b9c821b66f55d3cb6e94bcc022e0069b8f9c8fa38fa925c94b618ff71d1945349e2cac332d35f09fac3bcbe69'
  )
md5sums=(
  'da0f1e2749c1a4e9b143fcf3ba0e6ed1'
  '3f538d3a7747690c5906347a9b56acf7'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
