# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=nav
pkgver=1.0.1
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
  'a0a7f859bd7013dde6281071a7b078493c540cfde1b2c1876e09a1969ea08b8e46a8207aab26c60105859358beb6e5e8fda862c9746011596171c3565c184bad'
  'e1bd527e75cbd392f4449b3eb5c0995699f97903454dc439be46680a4df280a06b258ec87bed21c4a16bf78c7156815237ec9440e115115af9dc9a2b31f1e693'
  )
md5sums=(
  '4bc2a6d116246859961f806bf0d8c8cb'
  'e09e1a70917b45ba182cd7438221d5c2'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
