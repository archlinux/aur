# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=nav
pkgver=1.0.3
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
  '344b7c67fae22494eaa9205a1bcad363fc6ddafe45efaee39e12373801704030856aa0cdee8357f519e002b8569483516d53808062692ec723ea555c6c2d7142'
  '96ccead47a539c01b08170543a4cac2522fa96b5dc8fca65f36cfe9d4a9896a38b971305d5cd5554aa6c414a07294561cbb1ff375a5bfd77c5c0084a1fb67b98'
  )
md5sums=(
  'a7e2ae1e4c796ef52a9e9bbf41d34a1f'
  '17a8415723f86d7b544b6845f7e2937e'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
