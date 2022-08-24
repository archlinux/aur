# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=nav
pkgver=1.0.2
pkgrel=1
pkgdesc="A means of quick navigation through directories in the CLI"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(dialog)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '5ac622431e478a642737d1125527a15363fb5260cdd498ba02f45c3bcaf879ec1ae4c0a3d1e552aa36fcfa48b648131f757d3b585ba30935d94c0a669e1eb322'
  '1761e524f08970f5461d920bcb106c7f713b0d10da76cb40f925f8d8c7f99ae98a9ca04151e76d0cf5748b9d720a18fac75c22a91dd019613ba055a21544da53'
  )
md5sums=(
  '6d6bab1e8a68c69c1776cd9b0360931a'
  '9411dc24ca1b8850fd03e648f845631c'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
