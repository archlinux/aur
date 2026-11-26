# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-junit-report-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Convert Go test output to JUnit XML"
arch=('x86_64')
url="https://github.com/jstemmer/go-junit-report"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/jstemmer/go-junit-report/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-junit-report-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('3a1d422cc6a5cb78caad72d2f5b4ca6f81814fb31fa3fa044c4430df0f59539b')
sha256sums_x86_64=('d732451fe505862333f3e97e85ab429a69a4ab1a55c6baa387b184db4d714ba8')

package() {
  install -Dm755 "go-junit-report" "${pkgdir}/usr/bin/go-junit-report"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
