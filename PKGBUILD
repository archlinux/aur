# Maintainer: fubarhouse
pkgname=skpr
provides=('skpr' 'skpr-rsh')
pkgver=0.31.2
pkgrel=1.8
pkgdesc="CLI tool for managing web applications on the platform."
arch=('x86_64')
url="https://github.com/skpr/cli"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/skpr_${pkgver}_linux_amd64.tar.gz")
sha512sums=('7c958a8bf2bb13414707d4faa9d5d7dcb1fc9673c93efd75e7633553c3268e5d715c4e940afd681f8cbbf836d8026e791737256f3c9756c663fc2c0208fcb4a0')
provides=(skpr skpr-rsh)

package() {
  install -Dm755 "${srcdir}/${pkgname}_${pkgver}_linux_amd64/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}_${pkgver}_linux_amd64/${pkgname}-rsh" "${pkgdir}/usr/bin/${pkgname}-rsh"
}