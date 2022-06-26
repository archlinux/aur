# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=qcopy
pkgver=1.5
pkgrel=1
pkgdesc="Easily save important snippets such as passwords for quick access copying at any point"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(fzf dialog xsel bat)
install="qcopy.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '089ec19eecf7fb4995b1137c1b0ab8ae17b945884740307dccf035f95b02c221c0959aa4e7363905d959e1728f50501cd222173db7b457d8217f7c08568cbe91'
  '523d62da45c06080af56be948d8264cc47a5a9187a6b9d7e0d77b407c9957dd0eb31b4fb5eaaa077d4b97a01406c37e330ef92019033e4aabe97e27de925450f'
  )
md5sums=(
  '1211231737d706514013b55d94499fcd'
  '9f676e9636891aaf1b97147cee29d99d'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
