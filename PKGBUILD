# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=editenv
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple command line tool for conveniently storing and editing environment variables."
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(dialog xsel)
install="${pkgname}.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  '1cb12b918e4320b62526685ef5812e03e2769a24da5433a7de949f92a7ff374c5b1634a64d1b21a18a2f2616561342dfd77cf5c5ba8990080b3b32dea58c0e85'
)
md5sums=(
  '5d8ee1e5e41e64c4d18719b46a0a0c80'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" ||
  cd "$srcdir/${pkgname}"

  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

}
