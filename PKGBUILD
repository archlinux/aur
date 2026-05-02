# Maintainer: Anand Pant

pkgname=scryu-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="SCRYU terminal client"
arch=('x86_64')
url="https://scryu.com"
install="${pkgname}.install"
provides=('scryu')
conflicts=('scryu')
source=('https://install.scryu.com/releases/v0.0.1/scryu_v0.0.1_linux_amd64.tar.gz')
sha256sums=('5b9e9d482ee9d4b1439a2a44ddac28106a23623d753c435621c588c69a26aeb2')

package() {
  install -Dm755 "scryu_v${pkgver}_linux_amd64/scryu" \
    "${pkgdir}/usr/bin/scryu"
}
