# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=('gomod')
_srcname="gomod"
pkgver=0.7.1
pkgrel=1
pkgdesc="Go modules analysis tool"
provides=('gomod')
arch=('any')
license=('MIT')
url="https://github.com/Helcaraxan/gomod"
source=("git+${url}.git#tag=v${pkgver}")
makedepends=('go' 'git' 'glibc')

sha256sums=('SKIP')

build() {
    cd "${_srcname}"
    go build
}

package() {
    cd "${_srcname}"
    go build
    install -Dm 755 -t "${pkgdir}/usr/bin" gomod
}
