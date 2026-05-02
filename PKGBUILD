# Maintainer: Anand Pant

pkgname=scryu-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="SCRYU terminal client"
arch=('x86_64')
url="https://scryu.com"
install="${pkgname}.install"
provides=('scryu')
conflicts=('scryu')
source=('https://install.scryu.com/releases/v0.0.3/scryu_v0.0.3_linux_amd64.tar.gz')
sha256sums=('993abc8e62a1ba4b1dbe1848a8ce9b4580cf975b1ebc44e256b7a77edb1e681b')

package() {
  install -Dm755 "scryu_v${pkgver}_linux_amd64/scryu" \
    "${pkgdir}/usr/bin/scryu"
}
