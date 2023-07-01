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
  '6394a9cc7afe56384b388d157d76a1cbc1cd75c42adaecca5f09ab15de185008a6b175ab554f9d310e2be26c465f678956e5b7c1571d357c20df937b7ae9713f'
)
md5sums=(
  '945d53ac2a015e8c0138b9f24fde8235'
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
