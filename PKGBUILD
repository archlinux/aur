#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="Toolkit for swagger in golang (go-swagger)"
arch=('x86_64')
groups=('swagger')
provides=('swagger')
conflicts=('swagger')
url="https://goswagger.io"
license=("ASL 2.0")

source_x86_64=("swagger_linux_amd64_${pkgver}::https://github.com/go-swagger/go-swagger/releases/download/v${pkgver}/swagger_linux_amd64")
sha256sums_x86_64=('065cbce4622f40501966e4821ecea6627d7cbac4435e7c41d24b6d7c1411e540')

package() {
  install -d ${pkgdir}/usr/bin
  install -Tm755 "${srcdir}/swagger_linux_amd64_${pkgver}" "${pkgdir}/usr/bin/swagger"
}
