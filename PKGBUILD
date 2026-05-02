# Maintainer: Anand Pant

pkgname=scryu-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="SCRYU terminal client"
arch=('x86_64')
url="https://scryu.com"
install="${pkgname}.install"
provides=('scryu')
conflicts=('scryu')
source=('https://install.scryu.com/releases/v0.0.2/scryu_v0.0.2_linux_amd64.tar.gz')
sha256sums=('2ba208ab54102c08ff217afab071b6ad7f19cd053c52f87247766ab30c14cb1b')

package() {
  install -Dm755 "scryu_v${pkgver}_linux_amd64/scryu" \
    "${pkgdir}/usr/bin/scryu"
}
