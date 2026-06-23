# Maintainer: Anand Pant

pkgname=scryu-bin
pkgver=0.0.14
pkgrel=1
pkgdesc="SCRYU terminal client"
arch=('x86_64')
url="https://scryu.com"
install="${pkgname}.install"
provides=('scryu')
conflicts=('scryu')
source=('https://install.scryu.com/releases/v0.0.14/scryu_v0.0.14_linux_amd64.tar.gz')
sha256sums=('f9e177cc16698db9ccb7bc53e990d9c4c773a4b02f41b057f0eb4e6058ede281')

package() {
  install -Dm755 "scryu_v${pkgver}_linux_amd64/scryu" \
    "${pkgdir}/usr/bin/scryu"
}
