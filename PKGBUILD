# Maintainer: Philip Goto <philip.goto@gmail.com>
pkgname=cliqr
pkgver=1.0.0
pkgrel=1
pkgdesc="Command line QR code generator"
arch=('any')
url="https://github.com/flipflop97/cliqr"
license=('Creative Commons Attribution-ShareAlike 4.0 International Public License')
makedepends=('git' 'qrencode')
provides=('cliqr')
source=("${pkgname}::git+https://github.com/flipflop97/cliqr.git")
sha256sums=('SKIP')

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    install -dm 755 "${pkgdir}/usr/bin"
    install -m 755 "cliqr" "${pkgdir}/usr/bin"
}
