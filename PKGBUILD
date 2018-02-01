# Maintainer: grmat <grmat@sub.red>

pkgname=zcash-bin
pkgdesc='Official Zcash client, binary tarball version.'
pkgver=1.0.14
pkgrel=1
arch=('x86_64')
url='https://z.cash'
license=('MIT')
makedepends=('')
depends=()

source=("https://z.cash/downloads/zcash-${pkgver}-linux64.tar.gz")
sha256sums=('352ea2a67ae3484046a6bd43af9a5ce125e2d103a6a32ac71805658918f7076a')

package() {
  mkdir "${pkgdir}/usr"
  mv "${srcdir}/zcash-${pkgver}/bin" "${pkgdir}/usr/"
  mv "${srcdir}/zcash-${pkgver}/lib" "${pkgdir}/usr/"
  mv "${srcdir}/zcash-${pkgver}/include" "${pkgdir}/usr/"
  mv "${srcdir}/zcash-${pkgver}/share" "${pkgdir}/usr/"
}

