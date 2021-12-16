# Maintainer: aditya-K2 <adityakurdunkar2@gmail.com>
pkgname=gomp-git
pkgver=0.1
pkgrel=1
pkgdesc='MPD client inspired by ncmpcpp written in GO.'
arch=('any')
url="https://github.com/aditya-K2/gomp"
license=('GPL')
makedepends=('go')
source=("https://github.com/aditya-K2/gomp/archive/refs/heads/master.zip")
sha256sums=('SKIP')

build() {
    cd "${pkgname%-git}-master"
    go build
}

package() {
    cd "${pkgname%-git}-master"
    install -Dm 655 gomp -t "${pkgdir}/usr/bin"
}
