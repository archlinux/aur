# Maintainer: codechenx <codechenx@gmail.com>

pkgname=ftv-bin
pkgver=0.8
pkgrel=1
pkgdesc="Fast, feature-rich CSV/TSV/delimited file viewer for the command line"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/codechenx/FastTableViewer"
license=('MIT')
provides=('ftv')
conflicts=('ftv')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/FastTableViewer_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/FastTableViewer_${pkgver}_Linux_arm64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/FastTableViewer_${pkgver}_Linux_arm.tar.gz")
source_i686=("${pkgname}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/FastTableViewer_${pkgver}_Linux_i386.tar.gz")

sha256sums_x86_64=('a1d66ec6f9c9c5971176c6d615ccd820c76a232c4890a8e4c355dbdf44c53e69')
sha256sums_aarch64=('c450d471c7d524c9f60de6ef2978e85ccf46a1838e5191bdbd0dda384a1e927d')
sha256sums_armv7h=('27f3cfbc2e987b736d8cffcfd1b1c84e1d03cfaee36b9282b0eb43504e7707db')
sha256sums_i686=('1f1b49fac6cbf7158a083fc739401b6ba0864e0c4b53a8a262aaebd7dd11f7bc')

package() {
  install -Dm755 "${srcdir}/FastTableViewer" "${pkgdir}/usr/bin/ftv"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
