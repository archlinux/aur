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
  'eb2b7c91d7e131b99d8226e30d203be27c953fa7280f11a3a9cd8d2ee1297756df024b42a3cbd5f2503f044c4197093b86a49d73546f5e7b245bcdfe4fd8f968'
  '4f8807aa59f71a0d3d632e10db9e8e7bdb463f9a085bb59e91243003692c3e09b46d460137b691ceb0494ea43cdfb238d3a35ace113460fd22e8a5dad318b534'
  )
md5sums=(
  'aab2d8599331f18c8fb64ea998ddafd0'
  'cc0f31598b98ee2da7415bdcaf9a8a1d'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
