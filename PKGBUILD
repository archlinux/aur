# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=editenv
pkgver=0.1.2
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
  '64cf3489d0011979cad6d315c84d2abcce0700405764cefcad627ba18a34b6ae811c9dceecdeb99d0b78869c3ef5aba2920ff1a6169184d5b53adecebf3a38a6'
)
md5sums=(
  '7e109a4b1f1753c2230facea712f5f95'
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
