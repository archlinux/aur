# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.1.4
pkgrel=1
pkgdesc="A TUI based Invidious client"
arch=('x86_64')
url="https://github.com/darkhz/invidtui"
license=('MIT')
source=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=("0f744496c9abf124788f09993027fb9facab53f3da0f31d870fb0e510e862337")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
